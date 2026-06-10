import AppKit
import Foundation

@main
struct RenderOneModule {
    static func main() {
        let id = CommandLine.arguments.dropFirst().first ?? "life"
        guard let module = FracSettings.defaults.modules.first(where: { $0.id == id }) else {
            fputs("Unknown module: \(id)\n", stderr)
            exit(2)
        }
        var progressCount = 0
        let canvas = FracCanvas(width: 420, height: 260)
        canvas.progressInterval = 10_000
        canvas.progressHandler = { _ in progressCount += 1 }
        let image = FracRenderer(canvas: canvas, module: module, pointBudgetScale: 0.06).render()
        let nonBlack = canvas.nonBlackPixelCount()
        print("module=\(module.id) size=\(Int(image.size.width))x\(Int(image.size.height)) nonBlack=\(nonBlack) progressSnapshots=\(progressCount)")
        if nonBlack == 0 {
            exit(1)
        }
    }
}
