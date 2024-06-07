//
//  최빈값구하기.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 6/7/24.
//

import Foundation

/*
 최빈값은 주어진 값 중에서 가장 자주 나오는 값을 의미합니다. 정수 배열 array가 매개변수로 주어질 때, 최빈값을 return 하도록 solution 함수를 완성해보세요. 최빈값이 여러 개면 -1을 return 합니다.
 
 제한사항
 0 < array의 길이 < 100
 0 ≤ array의 원소 < 1000
 */

func solution(_ array: [Int]) -> Int {
    // 빈도가 저장될 딕셔너리
    var frequency: [Int: Int] = [:]
    
    // 빈도 계산
    for number in array {
        frequency[number, default: 0] += 1
    }
    
    // 최대 빈도 찾기
    let maxFrequency = frequency.values.max() ?? 0
    
    // 최대 빈도를 가진 값들을 필터링
    let modes = frequency.filter { $0.value == maxFrequency }.map { $0.key }
    
    // 최빈값이 여러 개인지 확인
    if modes.count > 1 {
        return -1
    } else {
        return modes.first ?? -1
    }
}
