//
//  ListNode.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class ListNode<Element> {

    var val: Element
    var next: ListNode<Element>?
    var prev: ListNode<Element>?

    init(val: Element) {
        self.val = val
    }
}
