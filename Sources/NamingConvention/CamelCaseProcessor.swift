import Foundation

final class CamelCaseProcessor: Processor {
    func match(text: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-z][a-z0-9A-Z]*")
        let result = regex.firstMatch(
            in: text, range: NSRange(location: 0, length: text.utf16.count))
        return result != nil
    }

    func segmented(text: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: "[a-z]+|[A-Z][a-z]*")
        let matches = regex.matches(
            in: text, range: NSRange(location: 0, length: text.utf16.count))
        return matches.map {
            let range = Range($0.range, in: text)!
            return String(text[range]).lowercased()
        }
    }

    func connected(segments: [String]) -> String {
        let head = segments.first
        let tail = segments.dropFirst()
        return (head?.lowercased() ?? "") + tail.map { $0.capitalized }.joined()
    }
}
