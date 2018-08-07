//
//  KthLargestElementInArray.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/6/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class KthLargestElementInArray {
    func findKthLargest(nums: [Int], k: Int) -> Int {
        var ourNums = nums
        return quickSelect(nums: &ourNums, k: k - 1, begin: 0, end: nums.count)
    }

    func quickSelect(nums: inout [Int], k: Int, begin: Int, end: Int) -> Int {
        let anchor = nums[end - 1]

        // This is another catch. It's very easy to set this begin to 0
        var lessAnchor = begin

        for i in begin ..< end {
            if nums[i] > anchor {
                nums.swapAt(lessAnchor, i)
                lessAnchor += 1
            }
        }

        nums.swapAt(lessAnchor, end - 1)
        if lessAnchor == k {
            return nums[lessAnchor]
        } else {
            if lessAnchor < k {
                return quickSelect(nums: &nums, k: k, begin: lessAnchor + 1, end: end)
            } else {
                return quickSelect(nums: &nums, k: k, begin: begin, end: lessAnchor)
            }
        }
    }

    func test() {
        print(findKthLargest(nums: [1, 3, 4, 5], k: 1))
        print(findKthLargest(nums: [1, 3, 4, 5], k: 2))
        print(findKthLargest(nums: [1, 3, 4, 5], k: 3))
        print(findKthLargest(nums: [1, 3, 4, 5], k: 4))
    }
}
