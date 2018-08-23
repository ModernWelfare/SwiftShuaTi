//
//  Palindromes.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/22/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class Palindromes {
    func isValidPalindrome(input: String) -> Bool {

        // This is amazing, a truly beautiful piece of code
        let filteredString = input.filter({ char in
            return (Character("a")...Character("z")).contains(char)
                || (Character("A")...Character("Z")).contains(char)
                || (Character("0")...Character("9")).contains(char)
        }).lowercased()

        return filteredString == String(filteredString.reversed())
    }
}
