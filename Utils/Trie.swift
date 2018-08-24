//
//  Trie.swift
//  SwiftShuati
//
//  Created by Bohao Li on 8/23/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

private class TrieNode {
    var isWord = false
    var children: [Character: TrieNode] = [:]
}

class Trie {
    
    private let root = TrieNode()
    
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
    
    func search(word: String) -> Bool {
        return searchHelper(word: word, node: root)
    }
    
    private func searchHelper(word: String, node: TrieNode) -> Bool {
        var currentNode = node
        
        for (index, char) in word.enumerated() {
            if char == Character(".") {
                for child in currentNode.children.values {
                    if searchHelper(word: word[index + 1..<word.count], node: child) {
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
