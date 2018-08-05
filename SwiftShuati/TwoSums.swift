//
//  TwoSums.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class TwoSums {

    func twoSums(nums: [Int], target: Int) -> [Int] {
        let sortedNums = nums.sorted()

        var start = 0
        var end = sortedNums.count - 1

        while end > start {
            if sortedNums[start] + sortedNums[end] < target {
                start += 1
            } else if sortedNums[start] + sortedNums[end] == target {
                return [start, end]
            } else {
                end -= 1
            }
        }

        return []
    }

    func test() {
        print(twoSums(nums: [2, 7, 11, 15], target: 9))
    }
}
