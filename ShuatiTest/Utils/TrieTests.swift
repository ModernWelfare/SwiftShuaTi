//
//  TrieTests.swift
//  ShuatiTest
//
//  Created by Bohao Li on 8/23/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation
import XCTest

class TrieTest: XCTestCase {

    var trie: Trie!

    override func setUp() {
        super.setUp()
        trie = Trie()
    }

    override func tearDown() {
        super.tearDown()
        trie = nil
    }

    func testAddhas() {
        trie.add(word: "Word")
        XCTAssert(trie.has(word: "Word"))
        XCTAssert(trie.has(word: "Wo.d"))
        XCTAssert(trie.has(word: ".o.d"))
        XCTAssert(trie.has(word: "...d"))
        XCTAssert(trie.has(word: "...."))
        
        XCTAssertFalse(trie.has(word: "...k"))
        
        trie.add(word: "d")
        XCTAssert(trie.has(word: "d"))
        XCTAssert(trie.has(word: "."))
        
        XCTAssertFalse(trie.has(word: ""))
    }

    func testInputAndMatches() {
        trie.addMultiple(words: ["ab", "ac"])
        XCTAssertEqual(Set(trie.matches(input: "a")), Set(["ab", "ac"]))
        XCTAssertEqual(trie.matches(input: "b"), [])
        XCTAssertEqual(trie.matches(input: "ab"), ["ab"])

        trie.addMultiple(words: ["abcd", "bcde"])
        print(trie.matches(input: "a"))
    }
}
