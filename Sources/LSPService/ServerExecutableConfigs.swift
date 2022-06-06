import FoundationToolz

struct ServerExecutableConfigs {
    
    static var languages: [String] {
        configs.keys.map { $0.capitalized }
    }
    
    static func config(language: String) -> Executable.Configuration? {
        configs[language.lowercased()]
    }
    
    static func set(_ config: Executable.Configuration,
                    forLanguage language: String) {
        configs[language.lowercased()] = config
    }
    
    private static var configs: [LanguageKey: Executable.Configuration] = [
        "swift": .init(
            path: "/usr/bin/xcrun",
            arguments: ["sourcekit-lsp"],
            environment: ["SOURCEKIT_LOGGING": "0"]
        ),
//            "python": .init(executablePath: "/Library/Frameworks/Python.framework/Versions/3.9/bin/pyls",
//                            arguments: [])
    ]
    
    typealias LanguageKey = String
}
