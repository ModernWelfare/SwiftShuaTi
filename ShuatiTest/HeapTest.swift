//
//  HeapTest.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/5/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class HeapTest: XCTestCase {

    func testHeapSort() {
        let heap = Heap<Int>()

        let testInput = [6, 8, 9, 3, 4, 2, 1]
        for num in testInput {
            heap.insert(element: num)
        }

        var sorted: [Int] = []

        while heap.top() != nil {
            sorted.append(heap.pop()!)
        }

        XCTAssert(sorted == [1, 2, 3, 4, 6, 8, 9])
    }

    func testFindKSmallest() {
        let heap = Heap<Int>()

        let testInput = [6, 8, 9, 3, 4, 2, 1]
        let testInput2 = [0, 100, 900, 300]

        for num in testInput {
            heap.insert(element: num)
        }

        var results: [Int] = []
        for _ in 0 ..< 3 {
            results.append(heap.pop()!)
        }

        for num in testInput2 {
            heap.insert(element: num)
        }

        for _ in 0 ..< 3 {
            results.append(heap.pop()!)
        }

        XCTAssert(results == [1, 2, 3, 0, 4, 6])
    }

    func testRemove() {
        let heap = Heap<Int>()

        let testInput = [6, 8, 9, 3, 4, 2, 1]

        for num in testInput {
            heap.insert(element: num)
        }

        heap.remove(element: 4)

        var sorted: [Int] = []
        while heap.top() != nil {
            sorted.append(heap.pop()!)
        }

        XCTAssert(sorted == [1, 2, 3, 6, 8, 9])
    }
}
