//
//  Subsets.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/5/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class Subsets {

    func subsets(nums: [Int]) -> [[Int]] {
        return helper(nums: nums, start: 0)
    }

    private func helper(nums: [Int], start: Int) -> [[Int]] {
        if start == nums.count {
            return [[]]
        }

        let partialResults = helper(nums: nums, start: start + 1)
        let num = nums[start]

        var newResults: [[Int]] = []
        for result in partialResults {
            newResults.append(result)

            // Most important lesson:
            // Arrays have full value semantics in Swift
            // They are exclusively passed by value
            // let array: [Int] == NSArray<NSInteger>
            // var array: [Int] == NSMutableArray<NSInteger>
            var newResult = result
            newResult.append(num)
            newResults.append(newResult)
        }

        return newResults
    }

    func test() {
        print(subsets(nums: [1, 2, 3]))
    }
}
