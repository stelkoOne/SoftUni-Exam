//
//  String+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 28.10.20.
//

import Foundation

extension String {
    
    func hexToInt() -> Int {
        Int(self, radix: 16) ?? 0
    }
    
    func firstMatch(of regexPattern: String) -> String {
        var regEx: NSRegularExpression?
        
        do {
            regEx = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
        }
        catch {
            print("Bum. \(error.localizedDescription)")
        }
        
        guard let firstMatch = regEx?.firstMatch(in: self, options: [], range: getRange()) else {
            return ""
        }
        
        return substring(with: firstMatch.range)
    }
    
    func substring(from startIdx: Int, to endIdx: Int) -> String {
        if length < startIdx || length < endIdx {
            return ""
        }
        
        let start = index(startIndex, offsetBy: startIdx)
        let end = index(startIndex, offsetBy: endIdx)
        
        return String(self[start..<end])
    }
    
    func substring(with range: NSRange) -> String {
        (self as NSString).substring(with: range)
    }
    
    func getRange() -> NSRange {
        NSRange(location: 0, length: length)
    }
    
    var length: Int {
        count
    }
}
