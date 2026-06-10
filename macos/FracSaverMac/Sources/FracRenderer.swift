import AppKit
import Foundation

final class FracRenderer {
    private let canvas: FracCanvas
    private let module: FracModule
    private var rng: FracRandom
    private let scale: Double
    private var color: NSColor

    init(canvas: FracCanvas, module: FracModule, pointBudgetScale: Double) {
        self.canvas = canvas
        self.module = module
        self.rng = FracRandom()
        self.scale = max(0.05, pointBudgetScale)
        self.color = .white
    }

    func render() -> NSImage {
        canvas.clear()
        color = .legacyRandom(&rng)
        switch module.id {
        case "Lorentz": lorenz(iterations(0, fallback: 40000))
        case "ross": rossler(iterations(0, fallback: 80000))
        case "Bird": bird()
        case "Binary": binary()
        case "Dendritic": dendritic()
        case "Feigenbaum": feigenbaum()
        case "Henon": henon(iterations(0, fallback: 70000))
        case "Organic": organic(iterations(0, fallback: 2_000_000))
        case "pascal": pascal()
        case "cantor": cantor()
        case "carpet": randomCarpet()
        case "circ": circles()
        case "coast": coast()
        case "fern": fern(iterations(0, fallback: 80000))
        case "gasket5": polygonGasket(points: 5, iterations: iterations(0, fallback: 200000), skipRepeats: false)
        case "Julia": juliaInverse(iterations(0, fallback: 100000))
        case "Koch": koch(level: Int(param(0, 5)))
        case "mset": mandelbrot()
        case "gasket3": sierpinski(iterations(0, fallback: 70000))
        case "snow4": polygonGasket(points: 4, iterations: iterations(0, fallback: 100000), skipRepeats: true)
        case "snow5": polygonGasket(points: 5, iterations: iterations(0, fallback: 100000), skipRepeats: true)
        case "snow6": polygonGasket(points: 6, iterations: iterations(0, fallback: 100000), skipRepeats: true)
        case "square": squareFrac(iterations(0, fallback: 610000))
        case "tree": tree(depth: Int(param(0, 10)))
        case "wave": wave()
        case "majority": majority(rule: Int(param(0, 4)), seedPercent: param(1, 0.5))
        case "1in8": oneInEight(percent: param(0, 70))
        case "land": landscape()
        case "bagula1": bagula(points: Int(param(1, 3)), iterations: iterations(0, fallback: 1_000_000))
        case "rndifs": randomIFS()
        case "1dca3": oneDCA3()
        case "grav": gravity()
        case "levy": levy(iterations: iterations(0, fallback: 350000), sides: Int(param(1, 2)))
        case "life": life(generations: Int(param(0, 5)))
        case "Contin": continuousCA()
        case "ThrowPic": throwPicture()
        case "PropSier": properSierpinski(depth: Int(param(0, 4)))
        case "boid": boids(seconds: param(0, 20), count: Int(param(1, 50)), acc: param(2, 0.4), rand: param(3, 0.5))
        case "hilbert": hilbert()
        case "Bool": randomBooleanNetwork()
        case "Gimps": gimps()
        case "JM": juliaMorpher()
        case "PG": pixelGame()
        case "ml1": malformations(m: Int(param(0, 5)))
        case "coolbag": coolBagula()
        case "forest": forest()
        default: labelOnly()
        }
        return canvas.image()
    }

    private func param(_ index: Int, _ fallback: Double) -> Double {
        index < module.parameters.count ? module.parameters[index] : fallback
    }

    private func iterations(_ index: Int, fallback: Int) -> Int {
        max(100, Int(Double(Int(param(index, Double(fallback)))) * scale))
    }

    private func plot(_ x: Double, _ y: Double, scaleX: Double, scaleY: Double, offsetX: Double, offsetY: Double, color: NSColor? = nil) {
        canvas.point(x * scaleX + offsetX, y * scaleY + offsetY, color ?? self.color)
    }

    private func linePlot(_ last: inout CGPoint?, _ x: Double, _ y: Double, scaleX: Double, scaleY: Double, offsetX: Double, offsetY: Double) {
        let point = CGPoint(x: x * scaleX + offsetX, y: y * scaleY + offsetY)
        if let last {
            canvas.line(from: last, to: point, color: color)
        }
        last = point
    }

    private func lorenz(_ n: Int) {
        var x = 1.0, y = 1.0, z = 1.0
        let a = 10.0, b = 28.0, c = 8.0 / 3.0, dt = 0.01
        var last: CGPoint?
        for _ in 0..<n {
            let dx = a * (y - x)
            let dy = b * x - y - x * z
            let dz = x * y - c * z
            x += dt * dx; y += dt * dy; z += dt * dz
            linePlot(&last, x, z, scaleX: Double(canvas.width) / 65, scaleY: Double(canvas.height) / 70, offsetX: Double(canvas.width) * 0.5, offsetY: Double(canvas.height) * 0.12)
        }
    }

    private func rossler(_ n: Int) {
        var x = -10.0, y = -1.0, z = -1.0
        let a = 0.2, b = 0.2, c = 5.7, dt = 0.005
        var last: CGPoint?
        for _ in 0..<n {
            let dx = -(y + z)
            let dy = x + y * a
            let dz = b + z * (x - c)
            x += dt * dx; y += dt * dy; z += dt * dz
            linePlot(&last, x, y + z, scaleX: Double(canvas.width) / 34, scaleY: -Double(canvas.height) / 44, offsetX: Double(canvas.width) * 0.5, offsetY: Double(canvas.height) * 0.68)
        }
    }

    private func henon(_ n: Int) {
        var x = 1.0, y = 1.0
        for _ in 0..<n {
            let r = y
            y = 0.3 * x
            x = r + 1 - 1.4 * x * x
            plot(x, y, scaleX: Double(canvas.width) * 0.36, scaleY: -Double(canvas.height) * 0.9, offsetX: Double(canvas.width) * 0.52, offsetY: Double(canvas.height) * 0.62)
        }
    }

    private func organic(_ n: Int) {
        var x = 0.0, y = 0.0
        for _ in 0..<n {
            plot(x, y, scaleX: Double(canvas.width) / 520, scaleY: Double(canvas.height) / 520, offsetX: Double(canvas.width) * 0.55, offsetY: Double(canvas.height) * 0.55)
            let nx: Double
            if x == 0 {
                nx = y
            } else if x > 0 {
                nx = y - sqrt(abs(17 * x - 1))
            } else {
                nx = y + sqrt(abs(17 * x + 4))
            }
            y = -137 - x
            x = nx
        }
    }

    private func bird() {
        var x = 3.0, y = 0.0
        let aa = -0.48, b = 0.93, c = 2 - 2 * aa
        var w = aa * x + c * x * x / (1 + x * x)
        for _ in 0..<Int(90000 * scale) {
            plot(x, y, scaleX: Double(canvas.width) / 20, scaleY: -Double(canvas.height) / 16, offsetX: Double(canvas.width) * 0.35, offsetY: Double(canvas.height) * 0.62)
            let old = x
            x = b * y + w
            let u = x * x
            w = aa * x + c * u / (1 + u)
            y = w - old
        }
    }

    private func feigenbaum() {
        var x = 0.3
        var lambda = 2.4
        for px in 0..<canvas.width {
            lambda += 1.6 / Double(canvas.width)
            for _ in 0..<130 {
                x = lambda * x * (1 - x)
                canvas.point(px, Int((1 - x) * Double(canvas.height)), color)
            }
        }
    }

    private func mandelbrot() {
        let xa = param(0, -2.1)
        let ya = param(1, 1.2)
        let xb = param(2, 0.8)
        let yb = param(3, -1.2)
        for py in 0..<canvas.height {
            for px in 0..<canvas.width {
                let cr = xa + (xb - xa) * Double(px) / Double(canvas.width)
                let ci = ya + (yb - ya) * Double(py) / Double(canvas.height)
                var zr = 0.0, zi = 0.0
                var i = 0
                while i < 64 && zr * zr + zi * zi <= 4 {
                    let nzr = zr * zr - zi * zi + cr
                    zi = 2 * zr * zi + ci
                    zr = nzr
                    i += 1
                }
                if i < 64 {
                    canvas.point(px, py, .spectrum(Double(i) / 64))
                }
            }
        }
    }

    private func juliaMorpher() {
        let cr = -0.78 + rng.next() * 0.25
        let ci = -0.18 + rng.next() * 0.35
        for py in 0..<canvas.height {
            for px in 0..<canvas.width {
                var zr = 3 * (Double(px) / Double(canvas.width) - 0.5)
                var zi = 2.3 * (Double(py) / Double(canvas.height) - 0.5)
                var i = 0
                while i < 70 && zr * zr + zi * zi <= 4 {
                    let nzr = zr * zr - zi * zi + cr
                    zi = 2 * zr * zi + ci
                    zr = nzr
                    i += 1
                }
                if i < 70 { canvas.point(px, py, .spectrum(Double(i) / 70)) }
            }
        }
    }

    private func juliaInverse(_ n: Int) {
        var x = 0.1, y = 0.1
        let c = CGPoint(x: -0.745, y: 0.113)
        for _ in 0..<n {
            let r = sqrt(hypot(x - c.x, y - c.y))
            let theta = atan2(y - c.y, x - c.x) / 2
            let sign = rng.next() < 0.5 ? -1.0 : 1.0
            x = sign * r * cos(theta)
            y = sign * r * sin(theta)
            plot(x, y, scaleX: Double(canvas.width) * 0.32, scaleY: Double(canvas.height) * 0.32, offsetX: Double(canvas.width) / 2, offsetY: Double(canvas.height) / 2)
        }
    }

    private func fern(_ n: Int) {
        var x = 0.0, y = 0.0
        for _ in 0..<n {
            let r = rng.next()
            let nx: Double
            let ny: Double
            if r < 0.01 {
                nx = 0; ny = 0.16 * y
            } else if r < 0.86 {
                nx = 0.85 * x + 0.04 * y; ny = -0.04 * x + 0.85 * y + 1.6
            } else if r < 0.93 {
                nx = 0.2 * x - 0.26 * y; ny = 0.23 * x + 0.22 * y + 1.6
            } else {
                nx = -0.15 * x + 0.28 * y; ny = 0.26 * x + 0.24 * y + 0.44
            }
            x = nx; y = ny
            plot(x, y, scaleX: Double(canvas.width) / 12, scaleY: -Double(canvas.height) / 11, offsetX: Double(canvas.width) * 0.5, offsetY: Double(canvas.height) * 0.96)
        }
    }

    private func sierpinski(_ n: Int) {
        polygonGasket(points: 3, iterations: n, skipRepeats: false)
    }

    private func polygonGasket(points count: Int, iterations n: Int, skipRepeats: Bool) {
        let radius = Double(min(canvas.width, canvas.height)) * 0.42
        let center = CGPoint(x: canvas.width / 2, y: canvas.height / 2)
        let vertices = (0..<count).map { i -> CGPoint in
            let angle = -Double.pi / 2 + 2 * Double.pi * Double(i) / Double(count)
            return CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        }
        var p = center
        var last = -1
        for _ in 0..<n {
            var choice = rng.int(count)
            if skipRepeats {
                while choice == last { choice = rng.int(count) }
            }
            last = choice
            p.x = (p.x + vertices[choice].x) / 2
            p.y = (p.y + vertices[choice].y) / 2
            canvas.point(p.x, p.y, color)
        }
    }

    private func squareFrac(_ n: Int) {
        var x = 20.0, y = 20.0
        for _ in 0..<n {
            canvas.point(x, y, color)
            let r = rng.next()
            if r < 0.25 {
                x /= 4; y /= 4
            } else if r < 0.5 {
                x = (Double(canvas.width) - x) / 3 + x; y /= 2
            } else if r < 0.75 {
                x /= 2; y = (Double(canvas.height) - y) / 2 + y
            } else {
                x = (Double(canvas.width) - x) / 2 + x
                y = (Double(canvas.height) - y) / 2 + y
            }
        }
    }

    private func bagula(points: Int, iterations n: Int) {
        let m = max(3, min(10, points))
        let vertices = unitPolygon(m)
        var x = 1.0, y = 1.0
        let r = sqrt(2) * sqrt(Double(m))
        for i in 0..<n {
            let l = rng.int(m)
            let nx: Double
            let ny: Double
            if l % 2 == 0 {
                nx = x / r - y / r + vertices[l].x
                ny = x / r + y / r + vertices[l].y
            } else {
                nx = x / r + y / r + vertices[l].x
                ny = -x / r + y / r + vertices[l].y
            }
            x = nx; y = ny
            if i > 10 { plot(x, y, scaleX: Double(canvas.width) * 0.18, scaleY: Double(canvas.height) * 0.18, offsetX: Double(canvas.width) / 2, offsetY: Double(canvas.height) / 2) }
        }
    }

    private func levy(iterations n: Int, sides: Int) {
        bagula(points: max(2, sides), iterations: n)
    }

    private func coolBagula() {
        let m = 3
        let vertices = unitPolygon(m)
        let ds = 1 - log(2) / log(Double(m))
        var x = 1.0, y = 1.0
        for _ in 0..<Int(100000 * scale) {
            let l = rng.int(m)
            x = x / 2 + vertices[l].x
            y = y / 2 + vertices[l].y
            guard abs(x) > 0.0001 else { continue }
            let y3 = (y * ds - x * (1 - ds)) / (x * x + y * y)
            let x3 = -y * y3 / x + ds / x
            plot(x3, y3, scaleX: Double(canvas.width) * 0.22, scaleY: Double(canvas.height) * 0.22, offsetX: Double(canvas.width) / 2, offsetY: Double(canvas.height) / 2)
        }
    }

    private func malformations(m: Int) {
        let count = max(2, min(9, m))
        var p = CGPoint(x: 0, y: 0)
        let vertices = unitPolygon(count)
        for _ in 0..<Int(120000 * scale) {
            let v = vertices[rng.int(count)]
            p.x = (p.x + v.x) * 0.5 + sin(p.y * 2) * 0.03
            p.y = (p.y + v.y) * 0.5 + cos(p.x * 2) * 0.03
            plot(p.x, p.y, scaleX: Double(canvas.width) * 0.28, scaleY: Double(canvas.height) * 0.28, offsetX: Double(canvas.width) / 2, offsetY: Double(canvas.height) / 2)
        }
    }

    private func randomIFS() {
        let transforms = (0..<4).map { _ in
            (
                a: rng.next() * 1.4 - 0.7,
                b: rng.next() * 1.4 - 0.7,
                c: rng.next() * 1.4 - 0.7,
                d: rng.next() * 1.4 - 0.7,
                e: rng.next() * 2 - 1,
                f: rng.next() * 2 - 1
            )
        }
        var x = 0.0, y = 0.0
        for i in 0..<Int(160000 * scale) {
            let t = transforms[rng.int(transforms.count)]
            let nx = t.a * x + t.b * y + t.e
            let ny = t.c * x + t.d * y + t.f
            x = max(-2, min(2, nx))
            y = max(-2, min(2, ny))
            if i > 20 { plot(x, y, scaleX: Double(canvas.width) * 0.22, scaleY: Double(canvas.height) * 0.22, offsetX: Double(canvas.width) / 2, offsetY: Double(canvas.height) / 2) }
        }
    }

    private func coast() {
        var x = 1.0, y = 2.0, j = 1.0
        for _ in 0..<Int(80000 * scale) {
            let r = y
            y = (cos(x) + sin(y) + sin(r)) * 0.5
            x = pow(abs(r), x.isFinite ? max(-2, min(2, x)) : 1)
            plot(x, y, scaleX: Double(canvas.width) * 0.35, scaleY: Double(canvas.height) * 0.35, offsetX: Double(canvas.width) * 0.2, offsetY: Double(canvas.height) * 0.5)
            x = pow(abs(x), j)
            y = pow(abs(y), j)
            j += 0.00002
            if j > 1.4 { j = 1 }
        }
    }

    private func randomCarpet() {
        var x = Double(canvas.width) / 2
        var y = Double(canvas.height) / 2
        var size = Double(min(canvas.width, canvas.height)) / 4
        for i in 0..<Int(50000 * scale) {
            if i % 6 == 0 {
                x = Double(canvas.width) / 2
                y = Double(canvas.height) / 2
                size = Double(min(canvas.width, canvas.height)) / 4
            }
            switch rng.int(4) {
            case 0: y -= size
            case 1: y += size
            case 2: x -= size
            default: x += size
            }
            size /= 2
            canvas.rect(CGRect(x: x - size / 2, y: y - size / 2, width: size, height: size), color: color)
        }
    }

    private func properSierpinski(depth: Int) {
        func recurse(_ rect: CGRect, _ level: Int) {
            guard level > 0 else { return }
            let w = rect.width / 3
            let h = rect.height / 3
            canvas.rect(CGRect(x: rect.minX + w, y: rect.minY + h, width: w, height: h), color: color)
            for ix in 0..<3 {
                for iy in 0..<3 where !(ix == 1 && iy == 1) {
                    recurse(CGRect(x: rect.minX + CGFloat(ix) * w, y: rect.minY + CGFloat(iy) * h, width: w, height: h), level - 1)
                }
            }
        }
        recurse(CGRect(x: 0, y: 0, width: canvas.width, height: canvas.height), max(1, min(6, depth)))
    }

    private func circles() {
        func recurse(_ center: CGPoint, _ radius: Double, _ level: Int) {
            guard level > 0, radius > 2 else { return }
            canvas.circle(center: center, radius: radius, color: color)
            recurse(CGPoint(x: center.x - radius / 2, y: center.y), radius / 2, level - 1)
            recurse(CGPoint(x: center.x + radius / 2, y: center.y), radius / 2, level - 1)
        }
        recurse(CGPoint(x: canvas.width / 2, y: canvas.height / 2), Double(min(canvas.width, canvas.height)) * 0.42, 9)
    }

    private func cantor() {
        func draw(_ x: Double, _ y: Double, _ length: Double, _ level: Int) {
            guard level > 0, length > 1 else { return }
            canvas.line(from: CGPoint(x: x, y: y), to: CGPoint(x: x + length, y: y), color: color)
            draw(x, y + 18, length / 3, level - 1)
            draw(x + length * 2 / 3, y + 18, length / 3, level - 1)
        }
        draw(Double(canvas.width) * 0.06, Double(canvas.height) * 0.15, Double(canvas.width) * 0.88, 8)
    }

    private func koch(level: Int) {
        func segment(_ a: CGPoint, _ b: CGPoint, _ level: Int) {
            guard level > 0 else {
                canvas.line(from: a, to: b, color: color)
                return
            }
            let dx = (b.x - a.x) / 3
            let dy = (b.y - a.y) / 3
            let p1 = CGPoint(x: a.x + dx, y: a.y + dy)
            let p3 = CGPoint(x: a.x + 2 * dx, y: a.y + 2 * dy)
            let angle = -Double.pi / 3
            let px = p1.x + dx * cos(angle) - dy * sin(angle)
            let py = p1.y + dx * sin(angle) + dy * cos(angle)
            let p2 = CGPoint(x: px, y: py)
            segment(a, p1, level - 1)
            segment(p1, p2, level - 1)
            segment(p2, p3, level - 1)
            segment(p3, b, level - 1)
        }
        let y = Double(canvas.height) * 0.65
        segment(CGPoint(x: Double(canvas.width) * 0.08, y: y), CGPoint(x: Double(canvas.width) * 0.92, y: y), max(1, min(7, level)))
    }

    private func tree(depth: Int) {
        func branch(_ start: CGPoint, _ length: Double, _ angle: Double, _ level: Int) {
            guard level > 0, length > 2 else { return }
            let end = CGPoint(x: start.x + cos(angle) * length, y: start.y + sin(angle) * length)
            canvas.line(from: start, to: end, color: color)
            branch(end, length * 0.72, angle - 0.55, level - 1)
            branch(end, length * 0.72, angle + 0.48, level - 1)
        }
        branch(CGPoint(x: canvas.width / 2, y: canvas.height - 10), Double(canvas.height) * 0.22, -Double.pi / 2, max(1, min(13, depth)))
    }

    private func wave() {
        for x in 0..<canvas.width {
            let t = Double(x) / Double(canvas.width)
            let y = (sin(t * 38) + sin(t * t * 400) * 0.5 + 1.5) / 3
            canvas.point(x, Int(y * Double(canvas.height)), color)
        }
    }

    private func pascal() {
        let rows = min(220, canvas.height)
        let cell = max(1, canvas.width / (rows + 2))
        var previous = [1]
        for row in 0..<rows {
            let y = row * cell
            let start = canvas.width / 2 - row * cell / 2
            for (i, value) in previous.enumerated() where value % 2 == 1 {
                canvas.rect(CGRect(x: start + i * cell, y: y, width: cell, height: cell), color: .spectrum(Double(row % 64) / 64))
            }
            var next = Array(repeating: 1, count: previous.count + 1)
            if previous.count > 1 {
                for i in 1..<previous.count {
                    next[i] = (previous[i - 1] + previous[i]) % 2
                }
            }
            previous = next
        }
    }

    private func binary() {
        let cell = max(2, min(canvas.width, canvas.height) / 80)
        for y in stride(from: 0, to: canvas.height, by: cell) {
            for x in stride(from: 0, to: canvas.width, by: cell) {
                if rng.next() > 0.5 {
                    canvas.rect(CGRect(x: x, y: y, width: cell, height: cell), color: rng.next() > 0.5 ? color : .spectrum(rng.next()))
                }
            }
        }
    }

    private func dendritic() {
        var walkers = (0..<500).map { _ in CGPoint(x: rng.next() * Double(canvas.width), y: rng.next() * Double(canvas.height)) }
        let center = CGPoint(x: canvas.width / 2, y: canvas.height / 2)
        canvas.circle(center: center, radius: 4, color: color, filled: true)
        for _ in 0..<Int(12000 * scale) {
            for index in walkers.indices {
                var p = walkers[index]
                let angle = rng.next() * Double.pi * 2
                p.x += cos(angle) * 2
                p.y += sin(angle) * 2
                p.x = max(0, min(Double(canvas.width - 1), p.x))
                p.y = max(0, min(Double(canvas.height - 1), p.y))
                if hypot(p.x - center.x, p.y - center.y) < Double(min(canvas.width, canvas.height)) * (0.04 + rng.next() * 0.42) {
                    canvas.point(p.x, p.y, color)
                }
                walkers[index] = p
            }
        }
    }

    private func oneDCA3() {
        var cells = (0..<canvas.width).map { _ in rng.next() > 0.5 ? 1 : 0 }
        for y in 0..<canvas.height {
            var next = cells
            for x in 1..<(canvas.width - 1) {
                let sum = cells[x - 1] + cells[x] + cells[x + 1]
                next[x] = (sum == 1 || sum == 2) ? 1 : 0
                if next[x] == 1 { canvas.point(x, y, color) }
            }
            cells = next
        }
    }

    private func majority(rule: Int, seedPercent: Double) {
        let cols = 96
        let rows = 72
        let cw = Double(canvas.width) / Double(cols)
        let ch = Double(canvas.height) / Double(rows)
        var cells = (0..<rows).map { _ in (0..<cols).map { _ in rng.next() < seedPercent ? 1 : 0 } }
        let threshold = max(1, min(8, rule))
        for _ in 0..<18 {
            var next = cells
            for y in 1..<(rows - 1) {
                for x in 1..<(cols - 1) {
                    var sum = 0
                    for dy in -1...1 {
                        for dx in -1...1 where !(dx == 0 && dy == 0) {
                            sum += cells[y + dy][x + dx]
                        }
                    }
                    next[y][x] = sum >= threshold ? 1 : 0
                    canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: next[y][x] == 1 ? color : .black)
                }
            }
            cells = next
        }
    }

    private func oneInEight(percent: Double) {
        majority(rule: 1, seedPercent: percent / 100)
    }

    private func life(generations: Int) {
        let cols = 160
        let rows = 100
        let cw = Double(canvas.width) / Double(cols)
        let ch = Double(canvas.height) / Double(rows)
        var cells = (0..<rows).map { _ in (0..<cols).map { _ in rng.next() < 0.25 ? 1 : 0 } }
        for _ in 0..<max(1, min(30, generations * 4)) {
            var next = cells
            for y in 1..<(rows - 1) {
                for x in 1..<(cols - 1) {
                    var sum = 0
                    for dy in -1...1 {
                        for dx in -1...1 where !(dx == 0 && dy == 0) {
                            sum += cells[y + dy][x + dx]
                        }
                    }
                    next[y][x] = (sum == 3 || (cells[y][x] == 1 && sum == 2)) ? 1 : 0
                    if next[y][x] == 1 {
                        canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: color)
                    }
                }
            }
            cells = next
        }
    }

    private func continuousCA() {
        let cols = canvas.width
        var current = (0..<cols).map { _ in rng.next() * rng.next() }
        var next = current
        for y in 0..<canvas.height {
            for x in 1..<(cols - 1) {
                let pop = current[x - 1] + current[x] + current[x + 1] + next[x - 1] + next[x + 1]
                next[x] = pop / 5
                canvas.point(x, y, .spectrum(next[x]))
            }
            current = next
        }
    }

    private func randomBooleanNetwork() {
        let n = 60
        let cw = Double(canvas.width) / Double(n)
        let ch = Double(canvas.height) / Double(n)
        var nodes = (0..<n).map { _ in (0..<n).map { _ in 1 } }
        let typ = (0..<n).map { _ in (0..<n).map { _ in rng.int(3) } }
        let inputs = (0..<n).map { _ in (0..<n).map { _ in (rng.int(n), rng.int(n), rng.int(n), rng.int(n)) } }
        for _ in 0..<15 {
            var next = nodes
            for y in 0..<n {
                for x in 0..<n {
                    let input = inputs[y][x]
                    switch typ[y][x] {
                    case 0: next[y][x] = nodes[input.1][input.0] == 0 ? 1 : 0
                    case 1: next[y][x] = (nodes[input.1][input.0] == 1 || nodes[input.3][input.2] == 1) ? 1 : 0
                    default: next[y][x] = (nodes[input.1][input.0] == 1 && nodes[input.3][input.2] == 1) ? 1 : 0
                    }
                    canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: next[y][x] == 1 ? color : .black)
                }
            }
            nodes = next
        }
    }

    private func pixelGame() {
        let n = 241
        let cw = Double(canvas.width) / Double(n)
        let ch = Double(canvas.height) / Double(n)
        let grid = (0..<n).map { _ in (0..<n).map { _ in rng.int(4) } }
        for fy in 0..<n {
            for fx in 0..<n {
                var x = fx
                var y = fy
                var seen = Set<Int>()
                for i in 0..<3000 {
                    switch grid[y][x] {
                    case 0: x = (x + n - 1) % n
                    case 1: x = (x + 1) % n
                    case 2: y = (y + n - 1) % n
                    default: y = (y + 1) % n
                    }
                    let key = y * n + x
                    if seen.contains(key) {
                        canvas.rect(CGRect(x: Double(fx) * cw, y: Double(fy) * ch, width: cw + 1, height: ch + 1), color: .spectrum(Double(i % 15) / 15))
                        break
                    }
                    seen.insert(key)
                }
            }
        }
    }

    private func gimps() {
        let n = 101
        let cw = Double(canvas.width) / Double(n)
        let ch = Double(canvas.height) / Double(n)
        var entropy = Array(repeating: Array(repeating: 0, count: n), count: n)
        var agents = (0..<50).map { _ in (x: rng.int(n), y: rng.int(n)) }
        for _ in 0..<300 {
            for y in 0..<n {
                for x in 0..<n where entropy[y][x] > 0 {
                    entropy[y][x] -= 1
                    canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: .spectrum(Double(entropy[y][x]) / 10))
                }
            }
            for i in agents.indices {
                let p = agents[i]
                var best = p
                var bestE = Int.max
                for dy in -1...1 {
                    for dx in -1...1 {
                        let nx = (p.x + dx + n) % n
                        let ny = (p.y + dy + n) % n
                        if entropy[ny][nx] < bestE {
                            bestE = entropy[ny][nx]
                            best = (nx, ny)
                        }
                    }
                }
                agents[i] = best
                entropy[best.y][best.x] = 10
            }
        }
    }

    private func gravity() {
        var bodies = (0..<30).map { _ in
            (
                x: rng.next() * Double(canvas.width),
                y: rng.next() * Double(canvas.height),
                vx: 0.0,
                vy: 0.0,
                mass: 10 + rng.next() * 2000
            )
        }
        for _ in 0..<1200 {
            for i in bodies.indices {
                for j in bodies.indices where i != j {
                    let dx = bodies[j].x - bodies[i].x
                    let dy = bodies[j].y - bodies[i].y
                    let dist = max(19, hypot(dx, dy))
                    let grav = 0.02 * bodies[j].mass / (dist * dist)
                    bodies[i].vx += dx / dist * grav
                    bodies[i].vy += dy / dist * grav
                }
                bodies[i].x += bodies[i].vx
                bodies[i].y += bodies[i].vy
                if bodies[i].x < 0 || bodies[i].x > Double(canvas.width) { bodies[i].vx *= -1 }
                if bodies[i].y < 0 || bodies[i].y > Double(canvas.height) { bodies[i].vy *= -1 }
                bodies[i].x = max(0, min(Double(canvas.width - 1), bodies[i].x))
                bodies[i].y = max(0, min(Double(canvas.height - 1), bodies[i].y))
                canvas.circle(center: CGPoint(x: bodies[i].x, y: bodies[i].y), radius: 2, color: .spectrum(min(1, hypot(bodies[i].vx, bodies[i].vy) / 3)), filled: true)
            }
        }
    }

    private func boids(seconds: Double, count: Int, acc: Double, rand: Double) {
        var boids = (0..<max(5, min(200, count))).map { _ in
            (
                x: rng.next() * Double(canvas.width),
                y: rng.next() * Double(canvas.height),
                vx: rng.next() * 20 - 10,
                vy: rng.next() * 20 - 10
            )
        }
        for _ in 0..<Int(max(120, seconds * 25)) {
            for i in boids.indices {
                let old = CGPoint(x: boids[i].x, y: boids[i].y)
                var nearest = i
                var distance = Double.greatestFiniteMagnitude
                for j in boids.indices where i != j {
                    let d = hypot(boids[i].x - boids[j].x, boids[i].y - boids[j].y)
                    if d < distance { distance = d; nearest = j }
                }
                if nearest != i {
                    if distance < 20 {
                        boids[i].vx += boids[i].x < boids[nearest].x ? -0.2 : 0.2
                        boids[i].vy += boids[i].y < boids[nearest].y ? -0.2 : 0.2
                    } else {
                        boids[i].vx += boids[i].x < boids[nearest].x ? acc : -acc
                        boids[i].vy += boids[i].y < boids[nearest].y ? acc : -acc
                    }
                }
                boids[i].vx += rand - rng.next() * rand
                boids[i].vy += rand - rng.next() * rand
                boids[i].vx = max(-8, min(8, boids[i].vx))
                boids[i].vy = max(-8, min(8, boids[i].vy))
                boids[i].x = (boids[i].x + boids[i].vx + Double(canvas.width)).truncatingRemainder(dividingBy: Double(canvas.width))
                boids[i].y = (boids[i].y + boids[i].vy + Double(canvas.height)).truncatingRemainder(dividingBy: Double(canvas.height))
                canvas.line(from: old, to: CGPoint(x: boids[i].x, y: boids[i].y), color: color)
            }
        }
    }

    private func landscape() {
        let cols = 180
        let rows = 120
        var heights = Array(repeating: Array(repeating: 0.0, count: cols), count: rows)
        heights[0][0] = rng.next()
        heights[0][cols - 1] = rng.next()
        heights[rows - 1][0] = rng.next()
        heights[rows - 1][cols - 1] = rng.next()
        for y in 0..<rows {
            for x in 0..<cols {
                let nx = Double(x) / Double(cols)
                let ny = Double(y) / Double(rows)
                heights[y][x] = (sin(nx * 12) + cos(ny * 9) + sin((nx + ny) * 18)) / 6 + 0.5 + (rng.next() - 0.5) * 0.15
            }
        }
        let cw = Double(canvas.width) / Double(cols)
        let ch = Double(canvas.height) / Double(rows)
        for y in 0..<rows {
            for x in 0..<cols {
                canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: .spectrum(max(0, min(1, heights[y][x]))))
            }
        }
    }

    private func hilbert() {
        var points: [CGPoint] = []
        func hilbert(_ x0: Double, _ y0: Double, _ xi: Double, _ xj: Double, _ yi: Double, _ yj: Double, _ n: Int) {
            if n <= 0 {
                points.append(CGPoint(x: x0 + (xi + yi) / 2, y: y0 + (xj + yj) / 2))
            } else {
                hilbert(x0, y0, yi / 2, yj / 2, xi / 2, xj / 2, n - 1)
                hilbert(x0 + xi / 2, y0 + xj / 2, xi / 2, xj / 2, yi / 2, yj / 2, n - 1)
                hilbert(x0 + xi / 2 + yi / 2, y0 + xj / 2 + yj / 2, xi / 2, xj / 2, yi / 2, yj / 2, n - 1)
                hilbert(x0 + xi / 2 + yi, y0 + xj / 2 + yj, -yi / 2, -yj / 2, -xi / 2, -xj / 2, n - 1)
            }
        }
        let size = Double(min(canvas.width, canvas.height)) * 0.82
        let x = (Double(canvas.width) - size) / 2
        let y = (Double(canvas.height) - size) / 2
        hilbert(x, y, size, 0, 0, size, 6)
        for pair in zip(points, points.dropFirst()) {
            canvas.line(from: pair.0, to: pair.1, color: color)
        }
    }

    private func forest() {
        let cols = 60
        let rows = 45
        let cw = Double(canvas.width) / Double(cols)
        let ch = Double(canvas.height) / Double(rows)
        var trees = (0..<rows).map { _ in (0..<cols).map { _ in rng.next() < 0.5927 ? 1 : 0 } }
        var burn = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        for y in 0..<rows where trees[y][0] == 1 { trees[y][0] = 2 }
        for _ in 0..<70 {
            var next = trees
            for y in 0..<rows {
                for x in 0..<cols {
                    switch trees[y][x] {
                    case 1:
                        var nearFire = false
                        for dy in -1...1 {
                            for dx in -1...1 {
                                let nx = x + dx, ny = y + dy
                                if nx >= 0, ny >= 0, nx < cols, ny < rows, trees[ny][nx] == 2, burn[ny][nx] > 1 {
                                    nearFire = true
                                }
                            }
                        }
                        if nearFire { next[y][x] = 2 }
                        canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: .systemGreen)
                    case 2:
                        burn[y][x] += 1
                        if burn[y][x] > 2 { next[y][x] = 3 }
                        canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: .systemOrange)
                    case 3:
                        canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: .darkGray)
                    default:
                        canvas.rect(CGRect(x: Double(x) * cw, y: Double(y) * ch, width: cw + 1, height: ch + 1), color: .black)
                    }
                }
            }
            trees = next
        }
    }

    private func labelOnly() {
        for _ in 0..<5000 {
            canvas.point(rng.int(canvas.width), rng.int(canvas.height), .spectrum(rng.next()))
        }
    }

    private func throwPicture() {
        guard let path = module.stringParameters.first, !path.isEmpty, let image = NSImage(contentsOfFile: NSString(string: path).expandingTildeInPath) else {
            labelOnly()
            return
        }
        let target = NSRect(x: 0, y: 0, width: canvas.width, height: canvas.height)
        let bitmap = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: canvas.width,
            pixelsHigh: canvas.height,
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: .deviceRGB,
            bytesPerRow: canvas.width * 4,
            bitsPerPixel: 32
        )!
        NSGraphicsContext.saveGraphicsState()
        if let context = NSGraphicsContext(bitmapImageRep: bitmap) {
            NSGraphicsContext.current = context
            NSColor.black.setFill()
            target.fill()
            let sourceSize = image.size
            guard sourceSize.width > 0, sourceSize.height > 0 else {
                NSGraphicsContext.restoreGraphicsState()
                labelOnly()
                return
            }
            let scale = min(target.width / sourceSize.width, target.height / sourceSize.height)
            let size = NSSize(width: sourceSize.width * scale, height: sourceSize.height * scale)
            let rect = NSRect(x: (target.width - size.width) / 2, y: (target.height - size.height) / 2, width: size.width, height: size.height)
            image.draw(in: rect)
        }
        NSGraphicsContext.restoreGraphicsState()
        guard let cg = bitmap.cgImage else {
            labelOnly()
            return
        }
        let rep = NSBitmapImageRep(cgImage: cg)
        for y in 0..<canvas.height {
            for x in 0..<canvas.width {
                if let sampled = rep.colorAt(x: x, y: y) {
                    canvas.point(x, y, sampled)
                }
            }
        }
    }

    private func unitPolygon(_ count: Int) -> [CGPoint] {
        (0..<count).map { i in
            let angle = -Double.pi / 2 + 2 * Double.pi * Double(i) / Double(count)
            return CGPoint(x: cos(angle), y: sin(angle))
        }
    }
}
