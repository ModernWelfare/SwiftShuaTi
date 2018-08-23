//
//  PalindromesTest.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class PalindromesTest: XCTestCase {

    let solution = Palindromes()

    func testIsValid() {
        XCTAssert(solution.isValidPalindrome(input: "A man, a plan, a canal: Panama"))
        XCTAssertFalse(solution.isValidPalindrome(input: "race a car"))
    }
}
