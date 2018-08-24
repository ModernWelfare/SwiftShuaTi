//
//  StringProblems.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class StringProblems {

    func atoi(input: String) -> Float {
        // Swift's string conversion is actually quite powerful, we don't
        // need to do anything here.
        return Float(input) ?? 0.0
    }
}
