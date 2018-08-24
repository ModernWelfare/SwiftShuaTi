//
//  FakeServer.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/23/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

protocol FakeServer: class {
    func sendRequest(url: String, completion: @escaping (String) -> Void)
}

/// The fake server implementation
class FakeServerImpl: FakeServer {

    let trie = Trie()

    /// To simulate the type ahead service. Method to record all input strings.
    ///
    /// - Parameter inputs: the input strings
    func record(inputs: [String]) {
        trie.addMultiple(words: inputs)
    }


    /// Returns the matching type ahead inputs
    ///
    /// - Parameters:
    ///   - input: the search query string
    ///   - completion: the matching results
    func search(input: String, completion: @escaping ([String]) -> Void) {
        let results = trie.matches(input: input)
        let deadlineTime = DispatchTime.now() + Double.random(in: 0 ..< 1)

        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            completion(results)
        }
    }

    /// Sends a fake url request and execute the callback
    ///
    /// - Parameters:
    ///   - url: the fake url
    ///   - completion: the call back, to be execuated at a random delay between 0s and 1s.
    func sendRequest(url: String, completion: @escaping (String) -> Void) {
        let response = "Response"

        let randomDelay = Double.random(in: 0 ..< 1)
        let deadlineTime = DispatchTime.now() + randomDelay
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            completion(url + "//" + response)
        })
    }
}
