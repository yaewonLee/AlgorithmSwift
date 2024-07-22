//
//  BFS.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 7/22/24.
//

import Foundation

func bfs(_ start: String, _ graph: [[String]]) -> [String] {
    // 인접 리스트 생성
    var adjacencyList = [String: [String]]()
    
    for edge in graph {
        let from = edge[0]
        let to = edge[1]
        
        if adjacencyList[from] == nil {
            adjacencyList[from] = []
        }
        adjacencyList[from]!.append(to)
        
        // 양방향 간선 추가 (필요 시)
        if adjacencyList[to] == nil {
            adjacencyList[to] = []
        }
        adjacencyList[to]!.append(from)
    }
    
    // 방문한 노드를 추적하기 위한 집합과 결과 리스트
    var visited = Set<String>()
    var result = [String]()
    var queue = [String]()
    
    // 시작 노드를 큐에 추가하고 방문 처리
    queue.append(start)
    visited.insert(start)
    
    // BFS 수행
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        result.append(currentNode)
        
        guard let neighbors = adjacencyList[currentNode] else {
            continue
        }
        
        for neighbor in neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
    
    return result
}

// 예시
let graph = [["A", "B"], ["B", "C"], ["C", "D"], ["D", "E"]]
let start = "A"
//print(bfs(start, graph)) // 출력: ["A", "B", "C", "D", "E"]
