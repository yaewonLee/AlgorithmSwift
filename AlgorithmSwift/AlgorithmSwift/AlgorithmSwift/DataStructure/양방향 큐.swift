//
//  양방향 큐.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 6/22/24.
//

import Foundation

// 양방향 큐(Deque)
struct Deque<T> {
    private var array: [T] = []

    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }

    mutating func enqueueBack(_ element: T) {
        array.append(element)
    }

    mutating func dequeueFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }

    mutating func moveToBack() {
        if let front = dequeueFront() {
            enqueueBack(front)
        }
    }

    func front() -> T? {
        return array.first
    }
}
