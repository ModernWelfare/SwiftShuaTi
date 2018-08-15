//
//  File.swift
//  SwiftShuati
//
//  Created by Bohao Li on 8/15/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class LongestValidParenthesisStrings {
    func longestValidParens(input: String) -> [String] {
        var results = Set<String>()

        let queue = Queue<String>()

        queue.enqueue(val: input)
        var hasFound = false

        while !queue.isEmpty() {
            let head = queue.dequeue()!
            if isValid(head) {
                hasFound = true
                results.insert(head)
            }

            if hasFound {
                continue
            }

            for (index, char) in head.enumerated() {
                if "()".contains(char) && (index == 0 || char != head[index - 1]) {
                    var newString = head
                    newString.remove(at: newString.index(newString.startIndex, offsetBy: index))
                    queue.enqueue(val: newString)
                }
            }
        }

        return Array(results)
    }

    func isValid(_ input: String) -> Bool {
        var count = 0

        for char in input {
            if char == "(" {
                count += 1
            } else if char == ")" {
                if count > 0 {
                    count -= 1
                } else {
                    return false
                }
            }
        }

        return count == 0
    }
}
