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
        "Lorentz": FracModuleMetadata(description: "Lorenz attractor. The original info text connects this weather-derived phase-space curve with Edward Lorenz and the butterfly effect.", parameters: [iterations], stringParameters: []),
        "ross": FracModuleMetadata(description: "Rossler attractor, based on Otto Rossler's 1976 differential equations.", parameters: [iterations], stringParameters: []),
        "Bird": FracModuleMetadata(description: "A wing-like dynamical system; the VB info text says the name simply seemed right.", parameters: [], stringParameters: []),
        "Binary": FracModuleMetadata(description: "A binary-number pattern expanded into a two-dimensional drawing.", parameters: [], stringParameters: []),
        "Dendritic": FracModuleMetadata(description: "Random walkers attach to lit cells, producing branching dendrite-like growth.", parameters: [], stringParameters: []),
        "Feigenbaum": FracModuleMetadata(description: "Quadratic iterator showing branching, periodicity, chaos, and stable solutions.", parameters: [], stringParameters: []),
        "Henon": FracModuleMetadata(description: "Henon attractor.", parameters: [iterations], stringParameters: []),
        "Organic": FracModuleMetadata(description: "Organic strange attractor from the IFS 2 tab.", parameters: [iterations], stringParameters: []),
        "pascal": FracModuleMetadata(description: "A Pascal-triangle-inspired pattern colored by odd/even structure.", parameters: [], stringParameters: []),
        "cantor": FracModuleMetadata(description: "Cantor bars: each iteration removes the middle third.", parameters: [], stringParameters: []),
        "carpet": FracModuleMetadata(description: "The older randomized Sierpinski carpet attempt from early FracSaver versions.", parameters: [], stringParameters: []),
        "circ": FracModuleMetadata(description: "Nested circles.", parameters: [], stringParameters: []),
        "coast": FracModuleMetadata(description: "A small experimental dynamical system from the original author.", parameters: [], stringParameters: []),
        "fern": FracModuleMetadata(description: "Barnsley's fern, adapted from Fractals for the Classroom.", parameters: [iterations], stringParameters: []),
        "gasket5": FracModuleMetadata(description: "Pentagon chaos-game gasket, like Sierpinski with five attractors.", parameters: [iterations], stringParameters: []),
        "Julia": FracModuleMetadata(description: "Reverse-iteration Julia set, so it emphasizes the outline.", parameters: [iterations], stringParameters: []),
        "Koch": FracModuleMetadata(description: "Koch curve from the Curves tab.", parameters: [FracParameterMetadata(label: "Depth", detail: "Recursive curve depth. The VB UI described this as 1-9.", minimum: 1, maximum: 9)], stringParameters: []),
        "mset": FracModuleMetadata(description: "Mandelbrot set viewport bounds. Each complex point is iterated as z -> z^2 + c and colored by escape behavior.", parameters: [
            FracParameterMetadata(label: "Xa", detail: "Left side of the complex-plane viewport.", minimum: nil, maximum: nil),
            FracParameterMetadata(label: "Ya", detail: "Top side of the complex-plane viewport.", minimum: nil, maximum: nil),
            FracParameterMetadata(label: "Xb", detail: "Right side of the complex-plane viewport.", minimum: nil, maximum: nil),
            FracParameterMetadata(label: "Yb", detail: "Bottom side of the complex-plane viewport.", minimum: nil, maximum: nil)
        ], stringParameters: []),
        "gasket3": FracModuleMetadata(description: "Sierpinski gasket drawn by recursive triangle subdivision.", parameters: [iterations], stringParameters: []),
        "snow4": FracModuleMetadata(description: "Four-sided IFS snowflake; attractors move the draw point to midpoints without immediately repeating.", parameters: [iterations], stringParameters: []),
        "snow5": FracModuleMetadata(description: "Five-sided IFS snowflake; attractors move the draw point to midpoints without immediately repeating.", parameters: [iterations], stringParameters: []),
        "snow6": FracModuleMetadata(description: "Six-sided IFS snowflake; attractors move the draw point to midpoints without immediately repeating.", parameters: [iterations], stringParameters: []),
        "square": FracModuleMetadata(description: "Four-attractor chaos game where one corner pulls more strongly than the others.", parameters: [iterations], stringParameters: []),
        "tree": FracModuleMetadata(description: "Recursive tree from the Deterministic tab.", parameters: [FracParameterMetadata(label: "Depth", detail: "Branch recursion depth. The VB UI described this as 2-12.", minimum: 2, maximum: 12)], stringParameters: []),
        "majority": FracModuleMetadata(description: "2-D cellular automaton majority rule.", parameters: [
            FracParameterMetadata(label: "Live-neighbor threshold", detail: "Cell survives when enough neighbors are alive. The VB default was 4.", minimum: 1, maximum: 8),
            FracParameterMetadata(label: "Initial live coverage", detail: "Decimal percentage of live cells at startup.", minimum: 0.01, maximum: 1)
        ], stringParameters: []),
        "wave": FracModuleMetadata(description: "A wave-like dynamical system with fractal character.", parameters: [], stringParameters: []),
        "1in8": FracModuleMetadata(description: "2-D cellular automaton where a cell is alive when exactly one of eight neighbors is alive.", parameters: [FracParameterMetadata(label: "Screen iterations", detail: "How many screen iterations to run.", minimum: 10, maximum: nil)], stringParameters: []),
        "land": FracModuleMetadata(description: "Fractal landscape generated by recursively perturbing rectangle midpoints.", parameters: [], stringParameters: []),
        "bagula1": FracModuleMetadata(description: "Lapidus' Sierpinski by Roger Bagula, generalized to polygons with more than three sides.", parameters: [
            iterations,
            FracParameterMetadata(label: "Number of sides", detail: "Polygon side count. The VB UI offered 3-10.", minimum: 3, maximum: 10)
        ], stringParameters: []),
        "rndifs": FracModuleMetadata(description: "Random IFS with random attractor counts and strengths.", parameters: [], stringParameters: []),
        "1dca3": FracModuleMetadata(description: "One-dimensional cellular automaton where each cell depends on the three cells above it.", parameters: [], stringParameters: []),
        "grav": FracModuleMetadata(description: "N-body gravity simulation with inverse-square attraction, trails, and velocity-based color.", parameters: [], stringParameters: []),
        "levy": FracModuleMetadata(description: "Levy dragon / Bagula variant.", parameters: [
            iterations,
            FracParameterMetadata(label: "Dragon number", detail: "The VB UI described this as 2-12.", minimum: 2, maximum: 12)
        ], stringParameters: []),
        "life": FracModuleMetadata(description: "Conway's Life with classic loneliness and overcrowding rules.", parameters: [FracParameterMetadata(label: "Screen iterations", detail: "Number of generations to draw.", minimum: 2, maximum: nil)], stringParameters: []),
        "Contin": FracModuleMetadata(description: "Continuous one-dimensional cellular automaton with non-discrete cell values.", parameters: [], stringParameters: []),
        "ThrowPic": FracModuleMetadata(description: "Displays a configured image file, matching the old ThrowPic module.", parameters: [
            FracParameterMetadata(label: "Seconds", detail: "How long to display the picture.", minimum: 10, maximum: nil)
        ], stringParameters: [
            FracParameterMetadata(label: "Image path", detail: "Path to a GIF, BMP, JPG, PNG, or other macOS-readable image.", minimum: nil, maximum: nil)
        ]),
        "PropSier": FracModuleMetadata(description: "Proper recursive Sierpinski carpet.", parameters: [FracParameterMetadata(label: "Depth", detail: "Recursive carpet depth.", minimum: 1, maximum: 7)], stringParameters: []),
        "boid": FracModuleMetadata(description: "Boids flocking simulation.", parameters: [
            FracParameterMetadata(label: "Seconds", detail: "How long this module runs before switching.", minimum: 10, maximum: nil),
            FracParameterMetadata(label: "Boid count", detail: "Number of boids in the flock.", minimum: 10, maximum: 200),
            FracParameterMetadata(label: "Acceleration", detail: "How strongly boids steer toward or away from neighbors.", minimum: 0, maximum: nil),
            FracParameterMetadata(label: "Velocity randomness", detail: "Randomness when matching velocity.", minimum: 0, maximum: nil)
        ], stringParameters: []),
        "hilbert": FracModuleMetadata(description: "Hilbert space-filling curve.", parameters: [], stringParameters: []),
        "Bool": FracModuleMetadata(description: "Random Boolean network with randomly connected cells and simple logic operators.", parameters: [], stringParameters: []),
        "Gimps": FracModuleMetadata(description: "Artificial-life trails: each agent follows cells with low trail value, creating worm-like paths.", parameters: [], stringParameters: []),
        "JM": FracModuleMetadata(description: "Julia set morpher based on reverse-iteration Julia sets.", parameters: [], stringParameters: []),
        "PG": FracModuleMetadata(description: "Pixel game: each cell points onward, and cells are colored by path or loop length.", parameters: [], stringParameters: []),
        "ml1": FracModuleMetadata(description: "Malformations 1 by M. Lichtenstein.", parameters: [FracParameterMetadata(label: "Number of sides", detail: "The VB UI described this as 2-10.", minimum: 2, maximum: 10)], stringParameters: []),
        "coolbag": FracModuleMetadata(description: "Sierpinski gasket modified by Roger Bagula.", parameters: [], stringParameters: []),
        "forest": FracModuleMetadata(description: "Percolation forest fire at probability .5927. The VB notes warn this one does not preview well.", parameters: [], stringParameters: [])
    ]
}
