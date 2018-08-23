//
//  QuickSelectTest.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class QuickSelectTest: XCTestCase {
    func testSelect() {
        let solution = QuickSelect()

        XCTAssertEqual(solution.quickSelect(on: [1], targetIndex: 0), 1)

        XCTAssertEqual(solution.quickSelect(on: [1, 2, 3, 4, 5], targetIndex: 0), 1)
        XCTAssertEqual(solution.quickSelect(on: [1, 2, 3, 4, 5], targetIndex: 1), 2)
        XCTAssertEqual(solution.quickSelect(on: [1, 2, 3, 4, 5], targetIndex: 2), 3)
        XCTAssertEqual(solution.quickSelect(on: [1, 2, 3, 4, 5], targetIndex: 3), 4)
        XCTAssertEqual(solution.quickSelect(on: [1, 2, 3, 4, 5], targetIndex: 4), 5)

        XCTAssertEqual(solution.quickSelect(on: [5, 4, 3, 2, 1], targetIndex: 4), 5)
    }
}

