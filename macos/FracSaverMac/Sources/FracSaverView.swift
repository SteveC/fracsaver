import AppKit
import ScreenSaver

@objc(FracSaverView)
public final class FracSaverView: ScreenSaverView {
    private var settings = SettingsStore.load()
    private var currentImage: NSImage?
    private var currentModule: FracModule?
    private var lastSwitch = Date.distantPast
    private var configController: FracSettingsWindowController?

    public override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        animationTimeInterval = isPreview ? 1.8 : 1.0
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        animationTimeInterval = 1.0
    }

    public override var hasConfigureSheet: Bool {
        true
    }

    public override var configureSheet: NSWindow? {
        settings = SettingsStore.load()
        let controller = FracSettingsWindowController(settings: settings) { [weak self] newSettings in
            SettingsStore.save(newSettings)
            self?.settings = newSettings
            self?.currentImage = nil
            self?.lastSwitch = .distantPast
        }
        configController = controller
        return controller.window
    }

    public override func startAnimation() {
        super.startAnimation()
        settings = SettingsStore.load()
        lastSwitch = .distantPast
        renderNextModule()
    }

    public override func animateOneFrame() {
        if Date().timeIntervalSince(lastSwitch) >= settings.secondsPerModule {
            renderNextModule()
        }
        setNeedsDisplay(bounds)
    }

    public override func draw(_ rect: NSRect) {
        NSColor.black.setFill()
        rect.fill()
        guard let image = currentImage else { return }
        image.draw(in: bounds)
        if settings.showModuleName, let currentModule {
            drawModuleName(currentModule.name)
        }
    }

    private func renderNextModule() {
        let enabled = settings.modules.filter(\.enabled)
        let modules = enabled.isEmpty ? FracSettings.defaults.modules : enabled
        currentModule = modules.randomElement()
        guard let currentModule else { return }
        let pixelScale = window?.backingScaleFactor ?? NSScreen.main?.backingScaleFactor ?? 2
        let width = max(320, min(2560, Int(bounds.width * pixelScale)))
        let height = max(240, min(1600, Int(bounds.height * pixelScale)))
        let canvas = FracCanvas(width: width, height: height)
        currentImage = FracRenderer(canvas: canvas, module: currentModule, pointBudgetScale: settings.pointBudgetScale).render()
        lastSwitch = Date()
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
