//
//  GoogleString.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 9/30/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class GoogleString {
    func sameOutput(lhs: String, rhs: String) -> Bool {
        var lIndex = lhs.count - 1
        var rIndex = rhs.count - 1

        lIndex = nextCharIndex(input: lhs, index: lIndex)
        rIndex = nextCharIndex(input: rhs, index: rIndex)

        while lIndex >= 0 && rIndex >= 0 {
            if lhs[lIndex] != rhs[rIndex] {
                return false
            }
            lIndex = nextCharIndex(input: lhs, index: lIndex - 1)
            rIndex = nextCharIndex(input: rhs, index: rIndex - 1)
        }

        return lIndex == -1 && rIndex == -1
    }

    func nextCharIndex(input: String, index: Int) -> Int {
        if index < 0 {
            return -1
        }

        var skipCount = input[index] == Character("*") ? 1 : 0
        var newIndex = skipCount > 0 ? index - 1 : index

        while skipCount > 0 && newIndex >= 0 {
            if input[newIndex] == Character("*") {
                skipCount += 1
            } else {
                skipCount -= 1
            }
            newIndex -= 1
        }

        return newIndex
    }
}
