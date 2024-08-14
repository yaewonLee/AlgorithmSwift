//
//  DoubleStackQueue.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 8/14/24.
//

import Foundation

struct QueueWithTwoStacks<T> {
    private var stack1: [T] = []
    private var stack2: [T] = []
    
    mutating func enqueue(_ element: T) {
        stack1.append(element)
    }
    
    mutating func dequeue() -> T? {
        if stack2.isEmpty {
            while let element = stack1.popLast() {
                stack2.append(element)
            }
        }
        return stack2.popLast()
    }
    
    func isEmpty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
    
    func peek() -> T? {
        if stack2.isEmpty {
            return stack1.first
        } else {
            return stack2.last
        }
    }
}
