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
}
