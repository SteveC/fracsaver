import AppKit
import ScreenSaver

@objc(FracSaverView)
public final class FracSaverView: ScreenSaverView {
    private var settings = SettingsStore.load()
    private var currentImage: NSImage?
    private var currentModule: FracModule?
    private var lastSwitch = Date.distantPast
    private var configController: FracSettingsWindowController?
    private var isRendering = false
    private var renderGeneration = 0
    private var renderStartedAt = Date.distantPast
    private var renderTimeout: TimeInterval { isPreview ? 4 : 7 }

    public override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        animationTimeInterval = isPreview ? 1.8 : 1.0
        FracLogger.logEnvironment()
        FracLogger.log("init frame=\(frame) preview=\(isPreview) log=\(FracLogger.logURL.path)")
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        animationTimeInterval = 1.0
        FracLogger.logEnvironment()
        FracLogger.log("init(coder:) frame=\(frame) preview=\(isPreview)")
    }

    public override var hasConfigureSheet: Bool {
        true
    }

    public override var configureSheet: NSWindow? {
        FracLogger.log("configureSheet requested")
        settings = SettingsStore.load()
        let controller = FracSettingsWindowController(settings: settings) { [weak self] newSettings in
            SettingsStore.save(newSettings)
            self?.settings = newSettings
            self?.currentImage = nil
            self?.lastSwitch = .distantPast
            FracLogger.log("settings saved modules=\(newSettings.modules.filter(\.enabled).count) seconds=\(newSettings.secondsPerModule) detail=\(newSettings.pointBudgetScale)")
        }
        configController = controller
        return controller.window
    }

    public override func startAnimation() {
        super.startAnimation()
        settings = SettingsStore.load()
        lastSwitch = .distantPast
        FracLogger.log("startAnimation bounds=\(bounds) frame=\(frame) enabledModules=\(settings.modules.filter(\.enabled).count)")
        renderNextModule()
    }

    public override func stopAnimation() {
        renderGeneration += 1
        isRendering = false
        FracLogger.log("stopAnimation")
        super.stopAnimation()
    }

    public override func animateOneFrame() {
        if currentImage == nil {
            FracLogger.log("animateOneFrame had no image; rendering now bounds=\(bounds)")
            renderNextModule()
        }
        if isRendering && Date().timeIntervalSince(renderStartedAt) > renderTimeout {
            FracLogger.log("render watchdog timeout generation=\(renderGeneration) elapsed=\(String(format: "%.3f", Date().timeIntervalSince(renderStartedAt)))s; advancing")
            renderGeneration += 1
            isRendering = false
            lastSwitch = .distantPast
            renderNextModule()
        }
        if Date().timeIntervalSince(lastSwitch) >= settings.secondsPerModule {
            renderNextModule()
        }
        setNeedsDisplay(bounds)
    }

    public override func draw(_ rect: NSRect) {
        NSColor.black.setFill()
        rect.fill()
        guard let image = currentImage else {
            FracLogger.log("draw with nil image rect=\(rect) bounds=\(bounds)")
            return
        }
        image.draw(in: bounds)
        if settings.showModuleName, let currentModule {
            drawModuleName(currentModule.name)
        }
    }

    private func renderNextModule() {
        if isRendering {
            FracLogger.log("render skipped because previous render is still running")
            return
        }
        let enabled = settings.modules.filter(\.enabled)
        let modules = enabled.isEmpty ? FracSettings.defaults.modules : enabled
        currentModule = modules.randomElement()
        guard let currentModule else { return }
        let pixelScale = window?.backingScaleFactor ?? NSScreen.main?.backingScaleFactor ?? 2
        let maxWidth = isPreview ? 640 : 1440
        let maxHeight = isPreview ? 480 : 960
        let fallbackWidth = isPreview ? 420 : 960
        let fallbackHeight = isPreview ? 300 : 600
        let boundsWidth = bounds.width > 1 ? Int(bounds.width * pixelScale) : fallbackWidth
        let boundsHeight = bounds.height > 1 ? Int(bounds.height * pixelScale) : fallbackHeight
        let width = max(320, min(maxWidth, boundsWidth))
        let height = max(240, min(maxHeight, boundsHeight))
        let placeholder = FracCanvas(width: width, height: height)
        forceVisibleFallback(on: placeholder)
        currentImage = placeholder.image()
        setNeedsDisplay(bounds)
        displayIfNeeded()
        let started = Date()
        isRendering = true
        renderStartedAt = started
        renderGeneration += 1
        let generation = renderGeneration
        let detail = settings.pointBudgetScale
        FracLogger.log("render start generation=\(generation) module=\(currentModule.id) name=\(currentModule.name) canvas=\(width)x\(height) bounds=\(bounds) timeout=\(renderTimeout)")
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let canvas = FracCanvas(width: width, height: height)
            canvas.progressInterval = self?.isPreview == true ? 18_000 : 45_000
            var lastProgress = Date.distantPast
            canvas.progressHandler = { canvas in
                let now = Date()
                guard now.timeIntervalSince(lastProgress) > 0.16 else { return }
                lastProgress = now
                let partialImage = canvas.image()
                let partialNonBlack = canvas.nonBlackPixelCount()
                DispatchQueue.main.async { [weak self] in
                    guard let self, self.renderGeneration == generation, self.isRendering else { return }
                    self.currentImage = partialImage
                    self.setNeedsDisplay(self.bounds)
                }
                FracLogger.log("render progress generation=\(generation) module=\(currentModule.id) nonBlackPixels=\(partialNonBlack)")
            }
            let image = FracRenderer(canvas: canvas, module: currentModule, pointBudgetScale: detail).render()
            let elapsed = Date().timeIntervalSince(started)
            let nonBlack = canvas.nonBlackPixelCount()
            let density = Double(nonBlack) / Double(width * height)
            FracLogger.log("render done generation=\(generation) module=\(currentModule.id) elapsed=\(String(format: "%.3f", elapsed))s nonBlackPixels=\(nonBlack) density=\(String(format: "%.4f", density))")
            if nonBlack == 0 || density < 0.002 {
                FracLogger.log("render too dark; forcing fallback sparkle for module=\(currentModule.id) density=\(String(format: "%.4f", density))")
                self?.forceVisibleFallback(on: canvas)
            }
            let finalImage = (nonBlack == 0 || density < 0.002) ? canvas.image() : image
            DispatchQueue.main.async {
                guard let self, self.renderGeneration == generation else {
                    FracLogger.log("render discarded module=\(currentModule.id) generation=\(generation)")
                    return
                }
                self.currentImage = finalImage
                self.isRendering = false
                self.lastSwitch = Date()
                self.setNeedsDisplay(self.bounds)
                FracLogger.log("render installed module=\(currentModule.id)")
            }
        }
        lastSwitch = Date()
    }

    private func forceVisibleFallback(on canvas: FracCanvas) {
        var rng = FracRandom()
        for _ in 0..<8000 {
            canvas.point(rng.int(canvas.width), rng.int(canvas.height), .spectrum(rng.next()))
        }
    }

    private func drawModuleName(_ name: String) {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left
        let attributes: [NSAttributedString.Key: Any] = [
            .font: NSFont.systemFont(ofSize: isPreview ? 10 : 24, weight: .medium),
            .foregroundColor: NSColor.white.withAlphaComponent(0.78),
            .paragraphStyle: paragraph
        ]
        let inset: CGFloat = isPreview ? 8 : 28
        let textRect = CGRect(x: inset, y: inset, width: bounds.width - inset * 2, height: isPreview ? 18 : 36)
        name.draw(in: textRect, withAttributes: attributes)
    }
}
