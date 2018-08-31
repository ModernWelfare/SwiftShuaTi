//
//  StringProblems.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class StringProblems {

    func atoi(input: String) -> Float {
        // Swift's string conversion is actually quite powerful, we don't
        // need to do anything here.
        return Float(input) ?? 0.0
    }

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
}
