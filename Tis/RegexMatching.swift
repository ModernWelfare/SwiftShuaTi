//
//  RegexMatching.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/5/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class RegexMatching {
    func isMatch(string: String, regex: String) -> Bool {
        var cache: [[Int]: Bool] = [:]
        return helper(string: string, regex: regex, sIndex: 0, rIndex: 0, cache: &cache)
    }

    private func helper(string: String, regex: String, sIndex: Int, rIndex: Int, cache: inout [[Int]: Bool]) -> Bool {
        if let cached = cache[[sIndex, rIndex]] {
            return cached
        }

        if sIndex == string.count && rIndex == regex.count {
            cache[[sIndex, rIndex]] = true
            return true
        }

        let isCurrentMatch = sIndex < string.count
            && rIndex < regex.count
            && ((regex[rIndex] == ".") || (string[sIndex] == regex[rIndex]))
        let hasStar = rIndex < regex.count - 1 && regex[rIndex + 1] == "*"

        let result: Bool
        if hasStar {
            let drop = helper(string: string, regex: regex, sIndex: sIndex, rIndex: rIndex + 2, cache: &cache)
            let consume = isCurrentMatch
                && helper(string: string, regex: regex, sIndex: sIndex + 1, rIndex: rIndex + 2, cache: &cache)
            let notConsume = isCurrentMatch
                && helper(string: string, regex: regex, sIndex: sIndex + 1, rIndex: rIndex, cache: &cache)
            result = drop || consume || notConsume
        } else {
            result = isCurrentMatch
                && helper(string: string, regex: regex, sIndex: sIndex + 1, rIndex: rIndex + 1, cache: &cache)
        }
        cache[[sIndex, rIndex]] = result
        return result
    }
}
