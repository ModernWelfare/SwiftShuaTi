//
//  BinarySearchWithRangeTest.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/30/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class BinarySearchWithRangeTest: XCTestCase {
    let solution = BinarySearchWithRange()

    func testLessThan() {
        XCTAssertEqual((solution.searchFirstValueIndexLessThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 6)), 8)
        XCTAssertEqual((solution.searchFirstValueIndexLessThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 5)), 7)
        XCTAssertEqual((solution.searchFirstValueIndexLessThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 4)), 6)
        XCTAssertEqual((solution.searchFirstValueIndexLessThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 3)), 4)
        XCTAssertEqual((solution.searchFirstValueIndexLessThanTarget(in: [1, 2, 2, 2, 2, 3, 3, 4, 5], target: 2)), 0)
        XCTAssertEqual((solution.searchFirstValueIndexLessThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 1)), -1)
        XCTAssertEqual((solution.searchFirstValueIndexLessThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 0)), -1)
    }

    func testGreaterThan() {
        XCTAssertEqual((solution.searchFirstValueGreaterThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 6)), -1)
        XCTAssertEqual((solution.searchFirstValueGreaterThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 5)), -1)
        XCTAssertEqual((solution.searchFirstValueGreaterThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 4)), 8)
        XCTAssertEqual((solution.searchFirstValueGreaterThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 3)), 7)
        XCTAssertEqual((solution.searchFirstValueGreaterThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 2)), 5)
        XCTAssertEqual((solution.searchFirstValueGreaterThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 1)), 3)
        XCTAssertEqual((solution.searchFirstValueGreaterThanTarget(in: [1, 1, 1, 2, 2, 3, 3, 4, 5], target: 0)), 0)
    }
}
