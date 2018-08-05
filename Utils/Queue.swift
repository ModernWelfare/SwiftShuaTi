//
//  Queue.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class Queue<Element> {

    private var headNode: ListNode<Element>?
    private var tailNode: ListNode<Element>?

    func head() -> Element? {
        return headNode?.val
    }

    func isEmpty() -> Bool {
        return headNode == nil
    }

    func dequeue() -> Element? {
        let value = headNode?.val
        headNode = headNode?.next
        return value
    }

    func enqueue(val: Element) {
        let node = ListNode(val: val)

        if headNode == nil {
            headNode = node
            tailNode = node
        } else {
            tailNode?.next = node
            tailNode = node
        }
    }
}
