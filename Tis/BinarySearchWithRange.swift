//
//  BinarySearchWithRange.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/30/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class BinarySearchWithRange {
    func searchFirstValueIndexLessThanTarget(in array: [Int], target: Int) -> Int {
        let sortedArray = array.sorted()

        var begin = 0
        var end = sortedArray.count

        var rStart = -1

        // If there's only one element in the remaining range, it'll never be touched.
        // So always check the last begin
        while begin < end - 1 {
            let mid = Int((begin + end) / 2)

            if array[mid] < target {
                if mid == array.count - 1 || array[mid + 1] >= target {
                    rStart = mid
                    break
                } else {
                    begin = mid
                }
            } else {
                end = mid
            }
        }

        if rStart == -1 && sortedArray[begin] < target {
            rStart = begin
        }

        // if no value's less than target, return -1
        return rStart
    }

    func searchFirstValueGreaterThanTarget(in array: [Int], target: Int) -> Int {
        let sortedArray = array.sorted()

        var begin = 0
        var end = array.count

        var rEnd = -1

        while begin < end - 1 {
            let mid = Int((begin + end) / 2)

            if array[mid] > target {
                if mid == 0 || sortedArray[mid - 1] <= target {
                    rEnd = mid
                    break
                } else {
                    end = mid
                }
            } else {
                begin = mid
            }
        }

        if rEnd == -1 && sortedArray[begin] > target {
            rEnd = begin
        }

        // if all values are less than target, return -1
        return rEnd
    }
}
