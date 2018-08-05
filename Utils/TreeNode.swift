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
