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

    func writeMessage(_ input: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print(input)
        case .error:
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
