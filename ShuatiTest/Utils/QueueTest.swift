//
//  QueueTest.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class QueueTest: XCTestCase {
    func test() {
        let queue = Queue<Int>()

        queue.enqueue(val: 1)
        queue.enqueue(val: 2)

        XCTAssert(queue.head()! == 1)
        XCTAssert(queue.dequeue()! == 1)
        XCTAssert(queue.head()! == 2)
    }

    func testEmpty() {
        let queue = Queue<Int>()

        XCTAssert(queue.dequeue() == nil)
    }
}
