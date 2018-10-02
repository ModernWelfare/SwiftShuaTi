//
//  GoogleString.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 9/30/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import XCTest

class GoogleStringTests: XCTestCase {

    func testSameInput() {
        let solution = GoogleString()

        XCTAssert(solution.sameOutput(lhs: "abc", rhs: "abc"))
        XCTAssert(solution.sameOutput(lhs: "ab*", rhs: "a"))
        XCTAssert(solution.sameOutput(lhs: "ab**", rhs: ""))
        XCTAssertFalse(solution.sameOutput(lhs: "ab**", rhs: "ab"))
    }
}
