//
//  LevelOrderTraversal.swift
//  SwiftShuati
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

class LevelOrderTraversal {
    func levelOrder(root: TreeNode) -> [[Int]] {
        var results: [[Int]] = []

        let queue = Queue<(TreeNode, Int)>()

        queue.enqueue(val: (root, 0))

        while !queue.isEmpty() {
            let (head, level) = queue.dequeue()!
            if level == results.count {
                results.append([])
            }
            results[level].append(head.value)
            if let leftNode = head.left {
                queue.enqueue(val: (leftNode, level + 1))
            }

            if let rightNode = head.right {
                queue.enqueue(val: (rightNode, level + 1))
            }
        }

        return results
    }
}
