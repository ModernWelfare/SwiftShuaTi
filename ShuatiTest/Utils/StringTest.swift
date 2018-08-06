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
}
