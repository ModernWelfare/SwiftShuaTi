//
//  StringProblems.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class StringProblems {

    func atoi(input: String) -> Int {
        let pattern = "[a-z]*"
        let regex = NSRegularExpression(pattern: pattern, options: [])
        return regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
    }

}
