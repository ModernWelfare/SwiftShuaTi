//
//  main.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

print("Hello world!")

let string = "This is a world!"

let filtered = string.filter { char in
    return (Character("a")...Character("z")).contains(char)
        || (Character("A")...Character("Z")).contains(char)
        || (Character("0")...Character("9")).contains(char)
}

print(filtered.lowercased())
