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

/// The much needed console IO class.
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

    /// Writes the message to output
    ///
    /// - Parameters:
    ///   - input: The message to write
    ///   - to: the output type, be it stdout or errors
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
}
