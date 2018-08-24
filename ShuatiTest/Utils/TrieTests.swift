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
    func testAddSearch() {
        let trie = Trie()
        
        trie.add(word: "Word")
        XCTAssert(trie.search(word: "Word"))
        XCTAssert(trie.search(word: "Wo.d"))
        XCTAssert(trie.search(word: ".o.d"))
        XCTAssert(trie.search(word: "...d"))
        XCTAssert(trie.search(word: "...."))
        
        XCTAssertFalse(trie.search(word: "...k"))
        
        trie.add(word: "d")
        XCTAssert(trie.search(word: "d"))
        XCTAssert(trie.search(word: "."))
        
        XCTAssertFalse(trie.search(word: ""))
    }
}
