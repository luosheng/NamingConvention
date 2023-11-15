//
//  PascalCaseProcessor.swift
//
//
//  Created by Luo Sheng on 2023/11/16.
//

import Foundation

class PascalCaseProcessor: Processor {
    
    public func match(text: String) -> Bool {
        return false
    }
    
    public func segmented(text: String) -> [String] {
        return []
    }
    
    public func connected(segments: [String]) -> String {
        return ""
    }

}
