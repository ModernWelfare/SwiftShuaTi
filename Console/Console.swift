//
//  Console.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/24/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {

    /// This is how you get the input from the keyboard.
    /// Apparently, the program hangs waiting for valid input when `keyboard.availableData` is called.
    ///
    /// - Returns: The input string.
    func getInput() -> String {

        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let inputString = String(bytes: inputData, encoding: .utf8)!

        return inputString.trimmingCharacters(in: CharacterSet.newlines);
    }

    func writeMessage(_ input: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            // Writes to standard output
            print(input)
        case .error:
            // Writes to errors
            fputs("Error: \(input)", stderr)
        }
    }

    func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent

        writeMessage("usage:")
        writeMessage("\(executableName) -a string1 string2")
        writeMessage("or")
        writeMessage("\(executableName) -p string")
        writeMessage("or")
        writeMessage("\(executableName) -h to show usage information")
        writeMessage("Type \(executableName) without an option to enter interactive mode.")
    }

}
