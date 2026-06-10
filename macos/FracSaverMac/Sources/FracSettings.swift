import Foundation
import ScreenSaver

struct FracModule: Codable, Equatable {
    var id: String
    var name: String
    var category: String
    var parameters: [Double]
    var enabled: Bool
    var stringParameters: [String] = []
}

struct FracSettings: Codable, Equatable {
    var showModuleName: Bool
    var secondsPerModule: Double
    var pointBudgetScale: Double
    var modules: [FracModule]

    static let defaults = FracSettings(
        showModuleName: true,
        secondsPerModule: 12,
        pointBudgetScale: 0.35,
        modules: [
            FracModule(id: "Lorentz", name: "Lorenz Attractor", category: "Dynamic", parameters: [40000], enabled: true),
            FracModule(id: "ross", name: "Rossler Attractor", category: "Dynamic", parameters: [80000], enabled: true),
            FracModule(id: "Bird", name: "Bird", category: "Dynamic", parameters: [], enabled: true),
            FracModule(id: "Binary", name: "Binary", category: "Binary", parameters: [], enabled: true),
            FracModule(id: "Dendritic", name: "Dendritic", category: "Randomized", parameters: [], enabled: true),
            FracModule(id: "Feigenbaum", name: "Feigenbaum", category: "Dynamic", parameters: [], enabled: true),
            FracModule(id: "Henon", name: "Henon Attractor", category: "Dynamic", parameters: [70000], enabled: true),
            FracModule(id: "Organic", name: "Organic", category: "Dynamic", parameters: [2_000_000], enabled: true),
            FracModule(id: "pascal", name: "Pascal's Triangle", category: "Deterministic", parameters: [], enabled: true),
            FracModule(id: "cantor", name: "Cantor Bars", category: "Deterministic", parameters: [], enabled: true),
            FracModule(id: "carpet", name: "Carpet", category: "Carpet", parameters: [], enabled: true),
            FracModule(id: "circ", name: "Circles", category: "Curves", parameters: [], enabled: true),
            FracModule(id: "coast", name: "Coast", category: "IFS", parameters: [], enabled: true),
            FracModule(id: "fern", name: "Fern", category: "IFS", parameters: [80000], enabled: true),
            FracModule(id: "gasket5", name: "Pentagon Gasket", category: "IFS", parameters: [200000], enabled: true),
            FracModule(id: "Julia", name: "Julia Set", category: "IFS", parameters: [100000], enabled: true),
            FracModule(id: "Koch", name: "Koch Curve", category: "Curves", parameters: [7], enabled: true),
            FracModule(id: "mset", name: "Mandelbrot Set", category: "Mandel", parameters: [-1, 1, 2, -1], enabled: true),
            FracModule(id: "gasket3", name: "Sierpinski Gasket", category: "IFS", parameters: [7], enabled: true),
            FracModule(id: "snow4", name: "Snowflake 4", category: "Snow", parameters: [100000], enabled: true),
            FracModule(id: "snow5", name: "Snowflake 5", category: "Snow", parameters: [100000], enabled: true),
            FracModule(id: "snow6", name: "Snowflake 6", category: "Snow", parameters: [100000], enabled: true),
            FracModule(id: "square", name: "SquareFrac", category: "IFS", parameters: [610000], enabled: true),
            FracModule(id: "tree", name: "Tree", category: "IFS", parameters: [10], enabled: true),
            FracModule(id: "wave", name: "WaveFrac", category: "Curves", parameters: [], enabled: true),
            FracModule(id: "majority", name: "Majority Rule", category: "Majority", parameters: [4, 0.5], enabled: true),
            FracModule(id: "1in8", name: "2-D CA 1 in 8 Rule", category: "CAs", parameters: [70], enabled: true),
            FracModule(id: "land", name: "Fractal Landscape", category: "Randomized", parameters: [], enabled: true),
            FracModule(id: "bagula1", name: "Lapidus' Sierpinski", category: "IFS 2", parameters: [1_000_000, 3], enabled: true),
            FracModule(id: "rndifs", name: "Random IFS Pattern", category: "IFS 2", parameters: [], enabled: true),
            FracModule(id: "1dca3", name: "1-D CA", category: "CAs", parameters: [], enabled: true),
            FracModule(id: "grav", name: "Gravity", category: "Dynamic", parameters: [], enabled: true),
            FracModule(id: "levy", name: "Levy Dragon", category: "IFS 3", parameters: [350000, 2], enabled: true),
            FracModule(id: "life", name: "Life", category: "CAs", parameters: [5], enabled: true),
            FracModule(id: "Contin", name: "Continuous CA", category: "CAs", parameters: [], enabled: true),
            FracModule(id: "ThrowPic", name: "Throw Picture", category: "ThrowPic", parameters: [10], enabled: false, stringParameters: [""]),
            FracModule(id: "PropSier", name: "Proper Sierpinski Carpet", category: "Gasket", parameters: [4], enabled: true),
            FracModule(id: "boid", name: "Boids", category: "Boids", parameters: [20, 50, 0.4, 0.5], enabled: true),
            FracModule(id: "hilbert", name: "Hilbert Curve", category: "Curves", parameters: [], enabled: true),
            FracModule(id: "Bool", name: "Random Boolean Network", category: "Grid", parameters: [], enabled: true),
            FracModule(id: "Gimps", name: "Gimps", category: "Grid", parameters: [], enabled: true),
            FracModule(id: "JM", name: "Julia Morpher", category: "Mandel", parameters: [], enabled: true),
            FracModule(id: "PG", name: "Pixel Game", category: "Grid", parameters: [], enabled: true),
            FracModule(id: "ml1", name: "Malformations 1", category: "IFS 3", parameters: [5], enabled: true),
            FracModule(id: "coolbag", name: "Cool Bagula", category: "IFS 3", parameters: [], enabled: true),
            FracModule(id: "forest", name: "Percolation Net - Forest", category: "Grid", parameters: [], enabled: true)
        ]
    )
}

enum SettingsStore {
    private static let key = "FracSaverSettings.v1"
    private static let moduleName = "com.stevecoast.fracsaver.mac"

    static func load() -> FracSettings {
        let defaults = ScreenSaverDefaults(forModuleWithName: moduleName) ?? UserDefaults.standard
        guard let data = defaults.data(forKey: key),
              let settings = try? JSONDecoder().decode(FracSettings.self, from: data)
        else {
            return .defaults
        }
        return reconcile(settings)
    }

    static func save(_ settings: FracSettings) {
        let defaults = ScreenSaverDefaults(forModuleWithName: moduleName) ?? UserDefaults.standard
        if let data = try? JSONEncoder().encode(settings) {
            defaults.set(data, forKey: key)
            defaults.synchronize()
        }
    }

    static func reset() {
        save(.defaults)
    }

    private static func reconcile(_ settings: FracSettings) -> FracSettings {
        var byID = Dictionary(uniqueKeysWithValues: settings.modules.map { ($0.id, $0) })
        let modules = FracSettings.defaults.modules.map { defaultModule in
            var module = byID.removeValue(forKey: defaultModule.id) ?? defaultModule
            module.name = defaultModule.name
            module.category = defaultModule.category
            if module.parameters.count != defaultModule.parameters.count {
                module.parameters = defaultModule.parameters
            }
            if module.stringParameters.count != defaultModule.stringParameters.count {
                module.stringParameters = defaultModule.stringParameters
            }
            return module
        }
        return FracSettings(
            showModuleName: settings.showModuleName,
            secondsPerModule: max(3, min(120, settings.secondsPerModule)),
            pointBudgetScale: max(0.05, min(2, settings.pointBudgetScale)),
            modules: modules
        )
    }
}
