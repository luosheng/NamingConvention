//
//  Processor.swift
//
//
//  Created by Luo Sheng on 2023/11/16.
//

import Foundation

public protocol Processor {
    func match(text: String) -> Bool
    func segmented(text: String) -> [String]
    func connected(segments: [String]) -> String
}
