import Foundation

final class KebabCaseProcessor: Processor {
    func match(text: String) -> Bool {
        let pattern = #"^[a-z]+(-[a-z]+)*$"#  // regex pattern for kebab case
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: text)
    }

    func segmented(text: String) -> [String] {
        return text.components(separatedBy: "-")
    }

    func connected(segments: [String]) -> String {
        return segments.joined(separator: "-")
    }
}
