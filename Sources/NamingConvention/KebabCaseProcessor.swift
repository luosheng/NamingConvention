import Foundation

final class KebabCaseProcessor: Processor {
    func match(text: String) -> Bool {
        return false
    }

    func segmented(text: String) -> [String] {
        return []
    }

    func connected(segments: [String]) -> String {
        return ""
    }
}
