//
//  단방향큐.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 6/22/24.
//

import Foundation

struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count - head
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        // head가 queue.count보다 크거나 같다면 nil을 반환
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        // 주기적으로 앞의 빈 공간을 제거하여 메모리를 절약
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}
