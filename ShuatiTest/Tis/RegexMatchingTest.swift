//
//  RegexMatchingTest.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/5/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class RegexMatchingTest: XCTestCase {
    func test() {
        let solution = RegexMatching()

        var s = "aa"
        var p = "a"
        XCTAssertEqual(solution.isMatch(string: s, regex: p), false)

        s = "aa"
        p = "a*"
        XCTAssertEqual(solution.isMatch(string: s, regex: p), true)

        s = "ab"
        p = ".*"
        XCTAssertEqual(solution.isMatch(string: s, regex: p), true)

        s = "aab"
        p = "c*a*b"
        XCTAssertEqual(solution.isMatch(string: s, regex: p), true)

        s = "mississippi"
        p = "mis*is*p*."
        XCTAssertEqual(solution.isMatch(string: s, regex: p), false)
    }
}
