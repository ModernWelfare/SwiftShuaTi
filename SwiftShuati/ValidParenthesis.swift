//
//  ValidParenthesis.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class ValidParenthesis {

    static let map: [Character: Character] = [
        "}": "{",
        "]": "[",
        ")": "("
    ]

    func isValid(s: String) -> Bool {
        var stack: [Character] = []

        for char in s {
            if "{[(".contains(char) {
                stack.append(char)
            } else {
                if stack.last == ValidParenthesis.map[char] {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }

        return stack.isEmpty
    }

    func test() {
        print(isValid(s: "()[]{}"))
        print(isValid(s: "({"))
        print(isValid(s: "{[]}"))
    }
}
