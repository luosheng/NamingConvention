import Foundation

struct SnakeCaseProcessor: Processor {
    func match(text: String) -> Bool {
        let pattern = #"^[a-z]+(_[a-z]+)*$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: text)
    }

    func segmented(text: String) -> [String] {
        return text.components(separatedBy: "_")
    }

    func connected(segments: [String]) -> String {
        return segments.joined(separator: "_")
    }
}
