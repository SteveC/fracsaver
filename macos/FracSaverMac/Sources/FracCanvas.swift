import AppKit
import Foundation

struct FracRandom {
    private var state: UInt64

    init(seed: UInt64 = UInt64(Date().timeIntervalSince1970 * 1000)) {
        state = seed == 0 ? 0x1234_5678_9abc_def0 : seed
    }

    mutating func next() -> Double {
        state = state &* 6364136223846793005 &+ 1442695040888963407
        let value = state >> 11
        return Double(value) / Double(UInt64.max >> 11)
    }

    mutating func int(_ upperBound: Int) -> Int {
        guard upperBound > 0 else { return 0 }
        return min(upperBound - 1, Int(next() * Double(upperBound)))
    }
}

final class FracCanvas {
    let width: Int
    let height: Int
    var progressInterval = 60_000
    var progressHandler: ((FracCanvas) -> Void)?
    private var pixels: [UInt8]
    private var writeCount = 0

    init(width: Int, height: Int) {
        self.width = max(1, width)
        self.height = max(1, height)
        self.pixels = Array(repeating: 0, count: self.width * self.height * 4)
        clear()
    }

    func clear(_ color: NSColor = .black) {
        let rgba = Self.rgba(color)
        for index in stride(from: 0, to: pixels.count, by: 4) {
            pixels[index] = rgba.0
            pixels[index + 1] = rgba.1
            pixels[index + 2] = rgba.2
            pixels[index + 3] = 255
        }
    }

    func point(_ x: Double, _ y: Double, _ color: NSColor) {
        point(Int(x.rounded()), Int(y.rounded()), color)
    }

    func point(_ x: Int, _ y: Int, _ color: NSColor) {
        guard x >= 0, y >= 0, x < width, y < height else { return }
        let rgba = Self.rgba(color)
        let index = (y * width + x) * 4
        pixels[index] = rgba.0
        pixels[index + 1] = rgba.1
        pixels[index + 2] = rgba.2
        pixels[index + 3] = rgba.3
        writeCount += 1
        if progressInterval > 0, writeCount >= progressInterval {
            writeCount = 0
            progressHandler?(self)
        }
    }

    func line(from start: CGPoint, to end: CGPoint, color: NSColor) {
        var x0 = Int(start.x.rounded())
        var y0 = Int(start.y.rounded())
        let x1 = Int(end.x.rounded())
        let y1 = Int(end.y.rounded())
        let dx = abs(x1 - x0)
        let dy = -abs(y1 - y0)
        let sx = x0 < x1 ? 1 : -1
        let sy = y0 < y1 ? 1 : -1
        var error = dx + dy
        while true {
            point(x0, y0, color)
            if x0 == x1 && y0 == y1 { break }
            let e2 = 2 * error
            if e2 >= dy {
                error += dy
                x0 += sx
            }
            if e2 <= dx {
                error += dx
                y0 += sy
            }
        }
    }

    func rect(_ rect: CGRect, color: NSColor, filled: Bool = true) {
        let minX = max(0, Int(rect.minX.rounded()))
        let maxX = min(width - 1, Int(rect.maxX.rounded()))
        let minY = max(0, Int(rect.minY.rounded()))
        let maxY = min(height - 1, Int(rect.maxY.rounded()))
        guard minX <= maxX, minY <= maxY else { return }
        if filled {
            for y in minY...maxY {
                for x in minX...maxX {
                    point(x, y, color)
                }
            }
        } else {
            line(from: CGPoint(x: minX, y: minY), to: CGPoint(x: maxX, y: minY), color: color)
            line(from: CGPoint(x: maxX, y: minY), to: CGPoint(x: maxX, y: maxY), color: color)
            line(from: CGPoint(x: maxX, y: maxY), to: CGPoint(x: minX, y: maxY), color: color)
            line(from: CGPoint(x: minX, y: maxY), to: CGPoint(x: minX, y: minY), color: color)
        }
    }

    func circle(center: CGPoint, radius: Double, color: NSColor, filled: Bool = false) {
        let r = max(1, Int(radius.rounded()))
        let cx = Int(center.x.rounded())
        let cy = Int(center.y.rounded())
        if filled {
            for y in -r...r {
                let xSpan = Int(sqrt(Double(r * r - y * y)))
                for x in -xSpan...xSpan {
                    point(cx + x, cy + y, color)
                }
            }
        } else {
            var x = r
            var y = 0
            var err = 0
            while x >= y {
                point(cx + x, cy + y, color)
                point(cx + y, cy + x, color)
                point(cx - y, cy + x, color)
                point(cx - x, cy + y, color)
                point(cx - x, cy - y, color)
                point(cx - y, cy - x, color)
                point(cx + y, cy - x, color)
                point(cx + x, cy - y, color)
                y += 1
                if err <= 0 {
                    err += 2 * y + 1
                }
                if err > 0 {
                    x -= 1
                    err -= 2 * x + 1
                }
            }
        }
    }

    func image() -> NSImage {
        let data = Data(pixels)
        let rep = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: width,
            pixelsHigh: height,
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: .deviceRGB,
            bytesPerRow: width * 4,
            bitsPerPixel: 32
        )!
        data.copyBytes(to: rep.bitmapData!, count: pixels.count)
        let image = NSImage(size: NSSize(width: width, height: height))
        image.addRepresentation(rep)
        return image
    }

    func nonBlackPixelCount() -> Int {
        var count = 0
        for index in stride(from: 0, to: pixels.count, by: 4) {
            if pixels[index] > 0 || pixels[index + 1] > 0 || pixels[index + 2] > 0 {
                count += 1
            }
        }
        return count
    }

    private static func rgba(_ color: NSColor) -> (UInt8, UInt8, UInt8, UInt8) {
        let converted = color.usingColorSpace(.deviceRGB) ?? .white
        return (
            UInt8(max(0, min(255, Int(converted.redComponent * 255)))),
            UInt8(max(0, min(255, Int(converted.greenComponent * 255)))),
            UInt8(max(0, min(255, Int(converted.blueComponent * 255)))),
            UInt8(max(0, min(255, Int(converted.alphaComponent * 255))))
        )
    }
}

extension NSColor {
    static func legacyRandom(_ rng: inout FracRandom) -> NSColor {
        NSColor(
            calibratedRed: CGFloat(0.25 + rng.next() * 0.75),
            green: CGFloat(0.25 + rng.next() * 0.75),
            blue: CGFloat(0.25 + rng.next() * 0.75),
            alpha: 1
        )
    }

    static func spectrum(_ t: Double) -> NSColor {
        let value = max(0, min(1, t))
        return NSColor(
            calibratedHue: CGFloat(value),
            saturation: 0.85,
            brightness: 1,
            alpha: 1
        )
    }
}
