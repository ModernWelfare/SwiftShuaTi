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
        var dict: [[Int]:[String]] = [:]

        for s in strings {
            let code: [Int] = encodeString(s)
            if dict[code] == nil {
                dict[code] = []
            }
            dict[code]?.append(s)
        }

        var results: [[String]] = []

        for val in dict.values {
            results.append(val)
        }

        return results
    }

    func encodeString(_ string: String) -> [Int] {
        var code = Array(repeating: 0, count: 26)

        for c in string {
            code[Int(UnicodeScalar(String(c))!.value) - Int(UnicodeScalar(String("a"))!.value)] += 1
        }

        return code
    }

    func test() {
        print(groupAnagram(strings: ["eat", "tea", "tan", "ate", "nat", "bat"]))
    }
}
