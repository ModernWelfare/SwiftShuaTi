//
//  GroupAnagrams
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/5/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class GroupAnagrams {
    func groupAnagram(strings: [String]) -> [[String]] {
        var dict: [String:[String]] = [:]

        for s in strings {
            let code: [Int] = encodeString(s)
            if dict[code.description] == nil {
                dict[code.description] = []
            }
            dict[code.description]?.append(s)
        }

        var results: [[String]] = []

        for val in dict.values {
            results.append(val)
        }

        return results
    }

    func encodeString(_ string: String) -> [Int] {
        var code = Array(repeating: 0, count: 26)

        let baseValue: UInt32 = Character("a").unicodeScalars[Character("a").unicodeScalars.startIndex].value
        for c in string {
            let offset = c.unicodeScalars[c.unicodeScalars.startIndex].value - baseValue
            code[Int(offset)] += 1
        }

        return code
    }
}
