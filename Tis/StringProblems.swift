//
//  StringProblems.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class StringProblems {

    func areAnagrams(_ first: String, and second: String) -> Bool {
        let filteredFirst = first.replacingOccurrences(of: " ", with: "").lowercased()
        let filteredSecond = second.replacingOccurrences(of: " ", with: "").lowercased()

        return filteredFirst.sorted() == filteredSecond.sorted()
    }

    func arePalindromes(_ input: String) -> Bool {
        let filteredInput = input.filter { $0 != Character(" ") }

        return filteredInput == String(filteredInput.reversed())
    }

    func binaryAdd(num1: String, num2: String) -> String {
        var i1 = num1.count - 1;
        var i2 = num2.count - 1;

        var carry: Int = 0
        var result: Int

        var sumString: String = ""
        // always easier to extract the values first, rather than trying to finish off a remainder.
        while i1 >= 0 || i2 >= 0 {
            var num1Val: Int
            var num2Val: Int
            if i1 >= 0 {
                num1Val = Int(String(num1[i1]))!
                i1 -= 1
            } else {
                num1Val = 0
            }

            if i2 >= 0 {
                num2Val = Int(String(num2[i2]))!
                i2 -= 1
            } else {
                num2Val = 0
            }

            result = num2Val + num1Val + carry
            carry = result / 2
            result = result % 2
            sumString.append(contentsOf: String(result))
        }

        if carry > 0 {
            sumString.append(contentsOf: "1")
        }

        return String(sumString.reversed())
    }

    func asciiValue(c: Character) -> UInt32 {
        return c.unicodeScalars[c.unicodeScalars.startIndex].value
    }

    func isPalindrome(input: String) -> Bool {
        var begin = 0
        var end = input.count - 1

        while begin < end {
            begin = nextCharIndex(input: input, index: begin, isBegin: true)
            end = nextCharIndex(input: input, index: end, isBegin: false)

            if begin < end && input[begin] != input[end] {
                return false
            }
            begin += 1
            end -= 1
        }
        return true
    }

    private func nextCharIndex(input: String, index: Int, isBegin: Bool) -> Int {
        let offset = isBegin ? 1 : -1
        var newIndex = index
        while (newIndex >= 0 && newIndex < input.count) && !isAlphabetical(char: input[newIndex]) {
            newIndex += offset
        }
        return newIndex
    }

    func isAlphabetical(char: Character) -> Bool {
        return (char >= Character("A") && char <= Character("Z"))
            || (char >= Character("a") && char <= Character("z"))
    }

    func atoi(input: String) -> Int {
        let startIndex: Int
        let isNegative: Bool

        guard input.count > 0 else {
            return 0
        }

        if input[0] == Character("-") {
            startIndex = 1
            isNegative = true
        } else {
            startIndex = 0
            isNegative = false
        }

        var sum = 0

        for i in startIndex..<input.count {
            sum *= 10
            sum += input[i].intValue()
        }

        return isNegative ? -sum : sum
    }
}

extension Character {
    func intValue() -> Int {
        let uInt32Vlue = self.unicodeScalars[self.unicodeScalars.startIndex].value - 48
        return Int(uInt32Vlue)
    }
}
