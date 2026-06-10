import AppKit
import Foundation

@main
struct RenderSmokeTest {
    static func main() {
        let modules = FracSettings.defaults.modules
        var failures: [String] = []
        for module in modules {
            autoreleasepool {
                let canvas = FracCanvas(width: 320, height: 240)
                let image = FracRenderer(canvas: canvas, module: module, pointBudgetScale: 0.05).render()
                if image.size.width != 320 || image.size.height != 240 {
                    failures.append("\(module.id): unexpected image size \(image.size)")
                }
            }
        }
        if failures.isEmpty {
            print("Rendered \(modules.count) FracSaver modules successfully.")
        } else {
            fputs(failures.joined(separator: "\n") + "\n", stderr)
            exit(1)
        }
    }
}
