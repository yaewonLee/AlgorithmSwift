//
//  DFS.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 7/18/24.
//

/*
 DFS (Depth - First Search) 깊이우선탐색
 
 - 깊이 우선 탐색: 더이상 갈 곳이 없을 때까지 탐색
 - 그래프에서 깊은 부분을 우선적으로 탐색하는 알고리즘
 - 스택 또는 재귀함수를 이용
 - 다음에 방문할 인접한 노드를 스택에 푸시 → 방문 예정이므로 팝하여 방문 처리
 - DFS는 각 Level에 일부분만 저장하므로 BFS에 비해 메모리 메모리 사용률이 적다.
 - 찾고자하는 답이 트리에서부터 멀어질 수록 DFS가 유리하다. (BFS에 비해)
 - 트리 `전체를 순회`하고자 할 때 유리하다.
 - 탐색해야 할 때 최단거리를 구하는 게 아니라면 깊이우선 탐색을 고려하는 게 좋음
 */

/*
 
 */

import Foundation

// 재귀
func dfsHelper(node: String) {
    if visited.contains(node) {
        return
    }
    
    visited.insert(node)
    result.append(node)
    
    guard let neighbors = adjacencyList[node] else {
        return
    }
    
    for neighbor in neighbors {
        if !visited.contains(neighbor) {
            dfsHelper(node: neighbor)
        }
    }
}


// 스택
// 각 노드와 그 노드에 인접한 노드들의 리스트로 구성
func dfs(_ start: String, _ graph: [[String]]) -> [String] {
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

//print(dfs(start, graph)) // 출력: ["A", "B", "C", "D", "E"]

