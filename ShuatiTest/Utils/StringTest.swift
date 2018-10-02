//
//  File.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/5/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class StringTest: XCTestCase {
    func testSubscriptSingle() {
        let string = "This is a world!"

        let char = string[0]
        XCTAssert(char == "T")
    }

    func testSubscriptRange() {
        let string = "This is a world!"
        let substring = string[5 ..< 7]
        XCTAssertEqual(substring, "is")
    }

    func testPalindrome() {
        let solution = StringProblems()

        XCTAssert(solution.isPalindrome(input: "a"))
        XCTAssert(solution.isPalindrome(input: ""))
        XCTAssert(solution.isPalindrome(input: "aba"))
        XCTAssert(solution.isPalindrome(input: "ab,ba"))
        XCTAssertFalse(solution.isPalindrome(input: "abc"))
    }

    func testAToi() {
        let solution = StringProblems()
        XCTAssert(solution.atoi(input: "-123") == -123)
        XCTAssert(solution.atoi(input: "123") == 123)
        XCTAssert(solution.atoi(input: "0") == 0)
    }
}
