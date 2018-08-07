//
//  TreeNode.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class TreeNode {

    var left: TreeNode?
    var right: TreeNode?
    var value: Int

    init(value: Int) {
        self.value = value
    }

    static func serialize(root: TreeNode) -> [Int?] {
        let queue = Queue<TreeNode?>()

        queue.enqueue(val: root)
        var results: [Int?] = []

        while !queue.isEmpty() {
            let head = queue.dequeue()!
            if head != nil {
                // Only visit when dequeued from queue, this is how you do BFS.
                // Never visit anywhere else
                results.append(head?.value)
                queue.enqueue(val: head?.left)
                queue.enqueue(val: head?.right)
            } else {
                results.append(nil)
            }
        }

        // The hassle of stripping the leaf nodes
        // Why can't we strip the nils during the BFS, because we never know if the rightmost node will have
        // a rightmost child.
        var nilCount: Int = 0
        var i = results.count - 1

        // This piece is ugly...
        while i >= 0 {
            if results[i] == nil {
                nilCount += 1
                i -= 1
            } else {
                break
            }
        }

        // I bet array slice is for not modifying the array.
        // need to check on array slice.
        return Array(results.dropLast(nilCount))
    }

    /**
     Deserializes the tree pre-order
     */
    static func deserialize(input: [Int?]) -> TreeNode? {
        if input.count == 0 {
            return nil
        }

        let root = TreeNode(value: input[0]!)

        let queue = Queue<TreeNode>()
        queue.enqueue(val: root)

        var inputIndex = 1
        while inputIndex < input.count && !queue.isEmpty() {
            let head = queue.dequeue()
            if inputIndex < input.count, let val = input[inputIndex] {
                let leftNode = TreeNode(value: val)
                head?.left = leftNode
                queue.enqueue(val: leftNode)
            }
            inputIndex += 1

            if inputIndex < input.count, let val = input[inputIndex] {
                let rightNode = TreeNode(value: val)
                head?.right = rightNode
                queue.enqueue(val: rightNode)
            }
            inputIndex += 1
        }

        return root
    }
}
