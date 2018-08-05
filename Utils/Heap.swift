//
//  Heap.swift
//  ShuatiTest
//
//  Created by Bernard Hawke on 8/4/18.
//  Copyright © 2018 Bernard Hawke. All rights reserved.
//

import Foundation

/**
 Since there is no standard library I'll just do it myself, haha.
 */
class Heap<Element: Comparable> {

    private var elements: [Element] = []

    func top() -> Element? {
        if elements.isEmpty {
            return nil
        } else {
            return elements[0]
        }
    }

    func remove(element: Element) {
        guard let index = elements.index(of: element) else {
            return
        }
        siftUp(at: index)
    }

    func pop() -> Element? {
        if elements.isEmpty {
            return nil
        }

        let top = elements[0]

        // Merge the two heaps
        siftUp(at: 0)

        return top
    }

    func insert(element: Element) {
        elements.append(element)
        var elementIndex = elements.count - 1
        var parentIndex = parent(of: elementIndex)

        while parentIndex != elementIndex && elements[parentIndex] > elements[elementIndex] {
            elements.swapAt(parentIndex, elementIndex)
            elementIndex = parentIndex
            parentIndex = parent(of: elementIndex)
        }
    }

    private func siftUp(at index: Int) {
        let leftChildIndex = leftChild(of: index)
        let rightChildIndex = rightChild(of: index)

        if rightChildIndex >= elements.count {
            if leftChildIndex >= elements.count {
                elements.remove(at: index)
                return
            } else {
                elements.swapAt(index, leftChildIndex)
                siftUp(at: leftChildIndex)
            }
        } else {
            if elements[leftChildIndex] < elements[rightChildIndex] {
                elements.swapAt(index, leftChildIndex)
                siftUp(at: leftChildIndex)
            } else {
                elements.swapAt(index, rightChildIndex)
                siftUp(at: rightChildIndex)
            }
        }
    }

    private func parent(of index: Int) -> Int {
        if index == 0 {
            return 0
        }
        return (index - 1) / 2
    }

    private func leftChild(of index: Int) -> Int {
        return 2 * index + 1
    }

    private func rightChild(of index: Int) -> Int {
        return 2 * index + 2
    }
}
