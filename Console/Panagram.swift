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
    case quit = "q"
    case unknown

    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

class Panagram {
    let consoleIO = ConsoleIO()

    func interactiveMode() {
        //1
        consoleIO.writeMessage("Welcome to Panagram. This program checks if an input string is an anagram or palindrome.")
        //2
        var shouldQuit = false
        while !shouldQuit {
            //3
            consoleIO.writeMessage("Type 'a' to check for anagrams or 'p' for palindromes type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())

            switch option {
            case .anagram:
                //4
                consoleIO.writeMessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string:")
                let second = consoleIO.getInput()

                //5
                if StringProblems().areAnagrams(first, and: second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            case .palindrome:
                consoleIO.writeMessage("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = StringProblems().arePalindromes(s)
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .quit:
                shouldQuit = true
            default:
                //6
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }

    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]

        // This is for taking off the dash.
        let (option, value) = getOption(argument[1..<argument.count])

        switch option {
        case .anagram:
            //2
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                printUsage()
            } else {
                //3
                let first = CommandLine.arguments[2]
                let second = CommandLine.arguments[3]

                if StringProblems().areAnagrams(first, and: second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            }
        case .palindrome:
            //4
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                printUsage()
            } else {
                //5
                let s = CommandLine.arguments[2]
                let isPalindrome = StringProblems().arePalindromes(s)
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        //6
        case .help:
            printUsage()
        case .quit:
            break
        case .unknown:
            //7
            consoleIO.writeMessage("Unknown option \(value)")
            printUsage()
        }

    }

    /// Wraps the option string inside an enum
    ///
    /// - Parameter option: the option string
    /// - Returns: the returned enum
    func getOption(_ option: String) -> (type: OptionType, value: String) {
        return (type: OptionType(value: option), value: option)
    }

    func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent

        consoleIO.writeMessage("usage:")
        consoleIO.writeMessage("\(executableName) -a string1 string2")
        consoleIO.writeMessage("or")
        consoleIO.writeMessage("\(executableName) -p string")
        consoleIO.writeMessage("or")
        consoleIO.writeMessage("\(executableName) -h to show usage information")
        consoleIO.writeMessage("Type \(executableName) without an option to enter interactive mode.")
    }
}
