//
//  BinarySearchTree.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 8/16/24.
//

import Foundation

struct BinarySearchTree {
    private var tree: [Int?]
    private let maxSize: Int

    init(maxSize: Int) {
        self.maxSize = maxSize
        self.tree = Array(repeating: nil, count: maxSize + 1) 
        // 인덱스 1번부터 사용하기 위해 +1
    }

    mutating func insert(_ value: Int) {
        var index = 1 // 루트 노드의 위치는 인덱스 1

        while index <= maxSize {
            if tree[index] == nil {
                tree[index] = value
                return
            } else if value < tree[index]! {
                index = 2 * index
            } else {
                index = 2 * index + 1
            }
        }
        print("Tree is full, cannot insert \(value)")
    }

    func printTree() {
        print(tree)
    }
}

var bst = BinarySearchTree(maxSize: 15)
