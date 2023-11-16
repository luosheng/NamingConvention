// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct NamingConvention {
    public enum Style {
        case pascalCase
        case camelCase
        case kebabCase
        case snakeCase
    }

    public static let processors: [Style: Processor] = [
        .pascalCase: PascalCaseProcessor(),
        .camelCase: CamelCaseProcessor(),
        .kebabCase: KebabCaseProcessor(),
        .snakeCase: SnakeCaseProcessor(),
    ]

    public static func checkStyle(text: String) -> Style? {
        for (style, processor) in processors {
            if processor.match(text: text) {
                return style
            }
        }
        return nil
    }

    public static func match(text: String, style: Style) -> Bool {
        return processors[style]?.match(text: text) ?? false
    }

    public static func segmented(text: String, style: Style) -> [String] {
        return processors[style]?.segmented(text: text) ?? []
    }

    public static func convert(text: String, from: Style, to: Style) -> String {
        let segments = segmented(text: text, style: from)
        return processors[to]?.connected(segments: segments) ?? ""
    }
}
