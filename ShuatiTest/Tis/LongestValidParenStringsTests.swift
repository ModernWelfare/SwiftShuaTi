//
//  LongestValidParenStringsTests.swift
//  ShuatiTest
//
//  Created by Bohao Li on 8/15/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//


import Foundation
import XCTest

class LongestValidParenStringsTests: XCTestCase {

    let solution = LongestValidParenthesisStrings()

    func testIsValid() {
        XCTAssertTrue(solution.isValid(""))
        XCTAssertTrue(solution.isValid("1"))
        XCTAssertTrue(solution.isValid("()()"))
        XCTAssertTrue(solution.isValid("(())"))
    }

    func testLongest() {
        print(solution.longestValidParens(input: "()"))
        print(solution.longestValidParens(input: "())"))
        print(solution.longestValidParens(input: "())("))
        print(solution.longestValidParens(input: "())())"))
    }
    
    func testString() {
        var testString = "123"
        testString.insert("0", at: testString.startIndex)
        XCTAssertEqual(testString, "0123")
        testString.insert("5", at: testString.index(before: testString.endIndex))
        XCTAssertEqual(testString, "01253")
        XCTAssertEqual(testString[testString.startIndex ..< testString.index(testString.startIndex, offsetBy: 3)], "012")
    }
}
