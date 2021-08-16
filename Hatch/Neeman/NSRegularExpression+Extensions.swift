//
//  NSRegularExpression+Extensions.swift
//  Auckland Libraries
//
//  Created by Fraser on 19/08/20.
//  Copyright © 2020 IdleHandsApps. All rights reserved.
//

import Foundation

public extension NSRegularExpression {
    static func getFirstMatch(input: String, pattern: String) -> String? {
        var matchingString: String? = nil
        if let regex = try? NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive) {
            let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
            
            if let match = matches.first {
                let range = match.range(at:1)
                if let swiftRange = Range(range, in: input) {
                    matchingString = "\(input[swiftRange])"
                }
            }
        }
        return matchingString
    }
    
    static func getLastMatch(input: String, pattern: String) -> String? {
        return self.getMatches(input: input, pattern: pattern).last
    }
    
    static func getMatches(input: String, pattern: String) -> [String] {
        var matchingStrings = [String]()
        if let regex = try? NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive) {
            let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
            
            if let match = matches.first, match.numberOfRanges >= 3 {
                
                let range = match.range(at:1)
                if let swiftRange = Range(range, in: input) {
                    matchingStrings.append("\(input[swiftRange])")
                }
                let range2 = match.range(at:2)
                if let swiftRange = Range(range2, in: input) {
                    matchingStrings.append("\(input[swiftRange])")
                }
            }
        }
        return matchingStrings
    }
}
