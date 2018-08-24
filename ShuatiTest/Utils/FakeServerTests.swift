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

}
