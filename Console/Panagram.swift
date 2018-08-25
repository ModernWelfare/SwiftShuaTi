//
//  Panagram.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/24/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case unknown

    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        default: self = .unknown
        }
    }
}

class Panagram {
    let consoleIO = ConsoleIO()

    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        let (option, value) = getOption(argument[1..<argument.count])
        consoleIO.writeMessage("Argument count: \(argCount) Option: \(option) value: \(value)")
    }

    func getOption(_ option: String) -> (type: OptionType, value: String) {
        return (type: OptionType(value: option), value: option)
    }
}
