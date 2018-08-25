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
}
