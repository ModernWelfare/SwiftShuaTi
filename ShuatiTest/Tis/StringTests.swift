//
//  StringTests.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/24/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class StringTests: XCTestCase {

    let solution = StringProblems()

    func testAnagram() {
        XCTAssert(solution.areAnagrams("a bc ", and: "c b a"))
        XCTAssert(solution.areAnagrams("a", and: "a"))
        XCTAssertFalse(solution.areAnagrams("a", and: "b"))
    }

    func testPalindrome() {
        XCTAssert(solution.arePalindromes("aba"))
    }

    func testBinaryAdd() {
        XCTAssertEqual(solution.binaryAdd(num1: "10", num2: "111"), "1001")
        XCTAssertEqual(solution.binaryAdd(num1: "1", num2: "1"), "10")
        XCTAssertEqual(solution.binaryAdd(num1: "0", num2: "111"), "111")
        XCTAssertEqual(solution.binaryAdd(num1: "1", num2: "111"), "1000")
    }

    func testChar() {
        XCTAssertEqual(solution.asciiValue(c: Character("A")), 65)
    }
}
