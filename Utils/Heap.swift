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

        elements.swapAt(index, elements.count - 1)
        elements.removeLast()

        siftUp(at: index)
    }

    func pop() -> Element? {
        if elements.isEmpty {
            return nil
        }

        let top = elements[0]
        
        elements.swapAt(0, elements.count - 1)
        elements.removeLast()

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

        var smallestIndex: Int = index
        if leftChildIndex < elements.count && elements[leftChildIndex] < elements[smallestIndex] {
            smallestIndex = leftChildIndex
        }

        if rightChildIndex < elements.count && elements[rightChildIndex] < elements[smallestIndex] {
            smallestIndex = rightChildIndex
        }

        if index != smallestIndex {
            elements.swapAt(index, smallestIndex)
            siftUp(at: smallestIndex)
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
