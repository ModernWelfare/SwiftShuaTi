//
//  HammingDistance.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class HammingDistance {
    func hammingDistance(x: Int, y: Int) -> Int {
        var xOr = x ^ y

        var numberOfBits = 0

        var i = 0

        while i < 32 {
            numberOfBits += xOr & 1
            xOr = xOr >> 1
            i += 1
        }

        return numberOfBits
    }

    func test() {
        print(hammingDistance(x: 1, y: 4))
    }
}
