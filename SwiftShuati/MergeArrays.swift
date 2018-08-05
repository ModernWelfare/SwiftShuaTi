//
//  MergeArrays.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class Solution {

    func mergeArrays(nums1: inout [Int], m: Int, nums2: [Int], n: Int) {
        var iter1 = m - 1
        var iter2 = n - 1

        var mainIter = m + n - 1

        while iter1 >= 0 && iter2 >= 0 {
            if nums1[iter1] > nums2[iter2] {
                nums1[mainIter] = nums1[iter1]
                iter1 -= 1
            } else {
                nums1[mainIter] = nums2[iter2]
                iter2 -= 1
            }
            mainIter -= 1
        }

        while iter2 >= 0 {
            nums1[iter2] = nums2[iter2]
            iter2 -= 1
        }
    }
    
}
