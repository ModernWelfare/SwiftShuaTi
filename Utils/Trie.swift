//
//  Trie.swift
//  SwiftShuati
//
//  Created by Bohao Li on 8/23/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

/// The trie node
private class TrieNode {
    var isWord = false
    var children: [Character: TrieNode] = [:]
}

/// It is what is is, a trie.
class Trie {
    
    private let root = TrieNode()

    /// Adds a new word
    ///
    /// - Parameter word: the new word
    func add(word: String) {
        var currentNode = root
        for char in word {
            if let nextCurrent = currentNode.children[char] {
                currentNode = nextCurrent
            } else {
                let nextCurrent = TrieNode()
                currentNode.children[char] = nextCurrent
                currentNode = nextCurrent
            }
        }
        currentNode.isWord = true
    }

    /// Adds multiple words
    ///
    /// - Parameter words: the list of words
    func addMultiple(words: [String]) {
        words.forEach {
            add(word: $0)
        }
    }
    
    /// Whether a word is in the trie
    ///
    /// - Parameter word: word description
    /// - Returns: whether the word is in the trie
    func has(word: String) -> Bool {
        return hasHelper(word: word, node: root)
    }

    /// Returns the matches of the input
    ///
    /// - Parameter input: the input to be searched for matches
    /// - Returns: all matches with the input as prefix
    func matches(input: String) -> [String] {
        var results: [String] = []

        guard input.count > 0 else {
            return results
        }

        var currentNode = root

        for char in input {
            if let nextChild = currentNode.children[char] {
                currentNode = nextChild
            } else {
                return results
            }
        }

        let allSuffixes = collectAllWords(node: currentNode)
        allSuffixes.forEach {
            results.append(input + $0)
        }
        return results
    }

    private func collectAllWords(node: TrieNode) -> [String] {
        var suffixes: [String] = []

        var path: [Character] = []
        walkThrough(node: node, path: &path, results: &suffixes)
        return suffixes
    }

    private func walkThrough(node: TrieNode, path: inout [Character], results: inout [String]) {
        if node.isWord {
            results.append(String(path))
        }

        for (char, node) in node.children {
            path.append(char)
            walkThrough(node: node, path: &path, results: &results)
            path.removeLast()
        }
    }
    
    private func hasHelper(word: String, node: TrieNode) -> Bool {
        var currentNode = node
        
        for (index, char) in word.enumerated() {
            if char == Character(".") {
                for child in currentNode.children.values {
                    if hasHelper(word: String(word[word.index(word.startIndex, offsetBy: index + 1)..<word.endIndex]), node: child) {
                        return true
                    }
                }
                return false
            } else {
                if let nextCurrent = currentNode.children[char] {
                    currentNode = nextCurrent
                } else {
                    return false
                }
            }
        }
        
        return currentNode.isWord
    }
}
