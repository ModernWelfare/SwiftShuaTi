//
//  Typeahead.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/24/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class Typeahead {

    let consoleIO = ConsoleIO()
    let trie = Trie()

    init() {
        trie.addMultiple(words: ["abc", "acd"])
    }

    func interactiveMode() {

        while true {
            consoleIO.writeMessage("Please enter your search string, enter \"q!\" to quit: ")
            let input = consoleIO.getInput()
            guard input != "q!" else {
                break
            }

            let matches = trie.matches(input: input)

            consoleIO.writeMessage("Your results are: ")
            matches.forEach {
                consoleIO.writeMessage($0)
            }
        }
    }

}
