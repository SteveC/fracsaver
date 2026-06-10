import AppKit
import Foundation

@main
struct SettingsWindowSmokeTest {
    static func main() {
        let app = NSApplication.shared
        app.setActivationPolicy(.accessory)
        let controller = FracSettingsWindowController(settings: .defaults) { _ in }
        guard let window = controller.window else {
            fputs("settings window missing\n", stderr)
            exit(1)
        }
        let visible = NSScreen.main?.visibleFrame ?? NSRect(x: 0, y: 0, width: 900, height: 700)
        let frame = window.frame
        print("settingsWindow=\(Int(frame.width))x\(Int(frame.height)) visible=\(Int(visible.width))x\(Int(visible.height))")
        if frame.width > visible.width || frame.height > visible.height {
            fputs("settings window exceeds visible screen\n", stderr)
            exit(1)
        }
    }
}
