//
//  Combination.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 8/23/24.
//

import Foundation

func factorial(_ n: Int) -> Int {
    return (1...n).reduce(1, *)
}

func combination(_ n: Int, _ r: Int) -> Int {
    return factorial(n) / (factorial(r) * factorial(n - r))
}
