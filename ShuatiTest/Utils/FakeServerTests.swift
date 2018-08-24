//
//  FakeServerTests.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/23/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class FakeServerTest: XCTestCase {

    func testServer() {
        let server = FakeServerImpl()

        let exp = expectation(description: "response")
        server.sendRequest(url: "s") { response in
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
    }

    func testSearch() {
        let server = FakeServerImpl()

        server.record(inputs: [
            "https://github.com/ModernWelfare",
            "https://github.com/ModernWelfare/ai_hw1",
            "https://github.com/ModernWelfare/ai_hw1/tree/master/MoveStrategies",
            "https://github.com/ModernWelfare?tab=repositories"
            ])

        let exp = expectation(description: "response")

        server.search(input: "https://github.com/ModernWelfare/") { strings in
            XCTAssertEqual(strings, [
                "https://github.com/ModernWelfare/ai_hw1",
                "https://github.com/ModernWelfare/ai_hw1/tree/master/MoveStrategies",
                ])
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
    }
}
