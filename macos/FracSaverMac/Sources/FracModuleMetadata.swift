import Foundation

struct FracParameterMetadata {
    var label: String
    var detail: String
    var minimum: Double?
    var maximum: Double?
}

struct FracModuleMetadata {
    var description: String
    var parameters: [FracParameterMetadata]
    var stringParameters: [FracParameterMetadata]

    static func forModule(id: String) -> FracModuleMetadata {
        metadata[id] ?? FracModuleMetadata(
            description: "Legacy FracSaver module with no editable parameters.",
            parameters: [],
            stringParameters: []
        )
    }

    private static let iterations = FracParameterMetadata(label: "Iterations", detail: "More iterations draw a denser image and take longer.", minimum: 10, maximum: nil)

    private static let metadata: [String: FracModuleMetadata] = [
        "Lorentz": FracModuleMetadata(description: "Lorenz attractor from the Dynamic tab.", parameters: [iterations], stringParameters: []),
        "ross": FracModuleMetadata(description: "Rossler attractor from the Dynamic tab.", parameters: [iterations], stringParameters: []),
        "Henon": FracModuleMetadata(description: "Henon attractor from the Dynamic tab.", parameters: [iterations], stringParameters: []),
        "Organic": FracModuleMetadata(description: "Organic strange attractor from the IFS 2 tab.", parameters: [iterations], stringParameters: []),
        "fern": FracModuleMetadata(description: "Barnsley's fern, adapted from the original FracSaver IFS settings.", parameters: [iterations], stringParameters: []),
        "gasket5": FracModuleMetadata(description: "Pentagon gasket using the chaos game.", parameters: [iterations], stringParameters: []),
        "Julia": FracModuleMetadata(description: "Julia set by inverse iteration.", parameters: [iterations], stringParameters: []),
        "Koch": FracModuleMetadata(description: "Koch curve from the Curves tab.", parameters: [FracParameterMetadata(label: "Depth", detail: "Recursive curve depth. The VB UI described this as 1-9.", minimum: 1, maximum: 9)], stringParameters: []),
        "mset": FracModuleMetadata(description: "Mandelbrot viewport bounds from the Mandel tab.", parameters: [
            FracParameterMetadata(label: "Xa", detail: "Left side of the complex-plane viewport.", minimum: nil, maximum: nil),
            FracParameterMetadata(label: "Ya", detail: "Top side of the complex-plane viewport.", minimum: nil, maximum: nil),
            FracParameterMetadata(label: "Xb", detail: "Right side of the complex-plane viewport.", minimum: nil, maximum: nil),
            FracParameterMetadata(label: "Yb", detail: "Bottom side of the complex-plane viewport.", minimum: nil, maximum: nil)
        ], stringParameters: []),
        "gasket3": FracModuleMetadata(description: "Sierpinski gasket.", parameters: [iterations], stringParameters: []),
        "snow4": FracModuleMetadata(description: "Four-sided IFS snowflake.", parameters: [iterations], stringParameters: []),
        "snow5": FracModuleMetadata(description: "Five-sided IFS snowflake.", parameters: [iterations], stringParameters: []),
        "snow6": FracModuleMetadata(description: "Six-sided IFS snowflake.", parameters: [iterations], stringParameters: []),
        "square": FracModuleMetadata(description: "SquareFrac IFS module.", parameters: [iterations], stringParameters: []),
        "tree": FracModuleMetadata(description: "Recursive tree from the Deterministic tab.", parameters: [FracParameterMetadata(label: "Depth", detail: "Branch recursion depth. The VB UI described this as 2-12.", minimum: 2, maximum: 12)], stringParameters: []),
        "majority": FracModuleMetadata(description: "2-D cellular automaton majority rule.", parameters: [
            FracParameterMetadata(label: "Live-neighbor threshold", detail: "Cell survives when enough neighbors are alive. The VB default was 4.", minimum: 1, maximum: 8),
            FracParameterMetadata(label: "Initial live coverage", detail: "Decimal percentage of live cells at startup.", minimum: 0.01, maximum: 1)
        ], stringParameters: []),
        "1in8": FracModuleMetadata(description: "2-D cellular automaton 1-in-8 rule.", parameters: [FracParameterMetadata(label: "Screen iterations", detail: "How many screen iterations to run.", minimum: 10, maximum: nil)], stringParameters: []),
        "bagula1": FracModuleMetadata(description: "Lapidus' Sierpinski module by Roger Bagula.", parameters: [
            iterations,
            FracParameterMetadata(label: "Number of sides", detail: "Polygon side count. The VB UI offered 3-10.", minimum: 3, maximum: 10)
        ], stringParameters: []),
        "levy": FracModuleMetadata(description: "Levy dragon / Bagula variant.", parameters: [
            iterations,
            FracParameterMetadata(label: "Dragon number", detail: "The VB UI described this as 2-12.", minimum: 2, maximum: 12)
        ], stringParameters: []),
        "life": FracModuleMetadata(description: "Conway's Life.", parameters: [FracParameterMetadata(label: "Screen iterations", detail: "Number of generations to draw.", minimum: 2, maximum: nil)], stringParameters: []),
        "ThrowPic": FracModuleMetadata(description: "Displays a configured image file, matching the old ThrowPic module.", parameters: [
            FracParameterMetadata(label: "Seconds", detail: "How long to display the picture.", minimum: 10, maximum: nil)
        ], stringParameters: [
            FracParameterMetadata(label: "Image path", detail: "Path to a GIF, BMP, JPG, PNG, or other macOS-readable image.", minimum: nil, maximum: nil)
        ]),
        "PropSier": FracModuleMetadata(description: "Proper Sierpinski carpet.", parameters: [FracParameterMetadata(label: "Depth", detail: "Recursive carpet depth.", minimum: 1, maximum: 7)], stringParameters: []),
        "boid": FracModuleMetadata(description: "Boids flocking simulation.", parameters: [
            FracParameterMetadata(label: "Seconds", detail: "How long this module runs before switching.", minimum: 10, maximum: nil),
            FracParameterMetadata(label: "Boid count", detail: "Number of boids in the flock.", minimum: 10, maximum: 200),
            FracParameterMetadata(label: "Acceleration", detail: "How strongly boids steer toward or away from neighbors.", minimum: 0, maximum: nil),
            FracParameterMetadata(label: "Velocity randomness", detail: "Randomness when matching velocity.", minimum: 0, maximum: nil)
        ], stringParameters: []),
        "ml1": FracModuleMetadata(description: "Malformations 1 by M. Lichtenstein.", parameters: [FracParameterMetadata(label: "Number of sides", detail: "The VB UI described this as 2-10.", minimum: 2, maximum: 10)], stringParameters: [])
    ]
}
