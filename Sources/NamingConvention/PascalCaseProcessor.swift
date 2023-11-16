//
//  PascalCaseProcessor.swift
//
//
//  Created by Luo Sheng on 2023/11/16.
//

import Foundation

final class PascalCaseProcessor: Processor {

    func match(text: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z][a-z0-9A-Z]*")
        let result = regex.firstMatch(in: text, range: NSRange(location: 0, length: text.utf16.count))
        return result != nil
    }

    func segmented(text: String) -> [String] {
        var segments: [String] = []
        var currentSegment: String = ""
        for character in text {
            if character.isUppercase {
                if !currentSegment.isEmpty {
                    segments.append(currentSegment.lowercased())
                }
                currentSegment = String(character)
            } else {
                currentSegment.append(character)
            }
        }
        if !currentSegment.isEmpty {
            segments.append(currentSegment.lowercased())
        }
        return segments
    }

    func connected(segments: [String]) -> String {
        return segments.map { $0.capitalized }.joined()
    }

}
