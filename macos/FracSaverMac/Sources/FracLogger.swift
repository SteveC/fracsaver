import Foundation

enum FracLogger {
    private static let queue = DispatchQueue(label: "com.stevecoast.fracsaver.mac.logger")

    static var logURL: URL {
        let logs = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
            .appendingPathComponent("Logs", isDirectory: true)
        return logs.appendingPathComponent("FracSaverMac.log")
    }

    static var fallbackLogURL: URL {
        URL(fileURLWithPath: NSHomeDirectory())
            .appendingPathComponent("Library", isDirectory: true)
            .appendingPathComponent("Logs", isDirectory: true)
            .appendingPathComponent("FracSaverMac.log")
    }

    static func log(_ message: String) {
        let url = logURL
        let line = "\(timestamp()) \(message)\n"
        queue.async {
            do {
                try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
                if FileManager.default.fileExists(atPath: url.path) {
                    let handle = try FileHandle(forWritingTo: url)
                    try handle.seekToEnd()
                    if let data = line.data(using: .utf8) {
                        try handle.write(contentsOf: data)
                    }
                    try handle.close()
                } else {
                    try line.write(to: url, atomically: true, encoding: .utf8)
                }
            } catch {
                NSLog("FracSaverMac log failed: \(error.localizedDescription)")
            }
        }
    }

    static func logEnvironment() {
        log("environment home=\(NSHomeDirectory()) primaryLog=\(logURL.path) fallbackLog=\(fallbackLogURL.path)")
    }

    private static func timestamp() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.string(from: Date())
    }
}
