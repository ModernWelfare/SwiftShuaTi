//
//  QuickSelect.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class QuickSelect {

    func quickSelect(on array: [Int], targetIndex: Int) -> Int {
        if targetIndex >= array.count {
            fatalError("Index out of bounds")
        }

        var inputArray = array
        return helper(array: &inputArray, start: 0, end: array.count, targetIndex: targetIndex)
    }

    // note where the inout decorator should be.	
    private func helper(array: inout [Int], start: Int, end: Int, targetIndex: Int) -> Int {
        let anchor = array[end - 1]
        var lesserIndex = start

        for i in start ..< end {
            if array[i] < anchor {
                array.swapAt(lesserIndex, i)
                lesserIndex += 1
            }
        }

        // Need to check for this step since lesserIndex may increase to reach end
        if lesserIndex < end {
            array.swapAt(lesserIndex, end - 1)
        }

        if lesserIndex == targetIndex {
            return array[targetIndex]
        } else {
            if lesserIndex < targetIndex {
                return helper(array: &array, start: lesserIndex + 1, end: end, targetIndex: targetIndex)
            } else {
                return helper(array: &array, start: start, end: lesserIndex, targetIndex: targetIndex)
            }
        }
    }
}
