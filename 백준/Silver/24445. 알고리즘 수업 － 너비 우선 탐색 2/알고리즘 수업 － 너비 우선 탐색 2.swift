import Foundation

// 입력 받기
let input = readLine()!.split(separator: " ").map{Int($0)!}
// 배열 초기화
let N = input[0], M = input[1], R = input[2]
var visited = [Int](repeating: 0, count: N + 1)
var graph = [[Int]](repeating: [], count: N + 1)

// 간선 정보 입력
for _ in 0..<M {
    let node = readLine()!.split(separator: " ").map {Int($0)!}
    let u = node[0], v = node[1]
    graph[u].append(v)
    graph[v].append(u)
}

// BFS 정의
func bfs(startNode: Int) {
    // 방문 순서 초기화
    var order = 1
    // 시작 정점을 큐에 추가하면서 방문 처리
    var queue = [startNode]
    visited[startNode] = order
    // 방문했으므로 order를 증가
    order += 1
    // 큐에서 다음으로 방문할 노드의 위치
    var currentIndex = 0
    
    // 큐를 모두 순회할 때까지 반복
    while currentIndex < queue.count {
        // 큐에서 현재 노드를 꺼냄
        let currentNode = queue[currentIndex]
        currentIndex += 1
        // 현재 노드의 인접 노드를 내림차순으로 탐색
        for nextNode in graph[currentNode].sorted(by: >) {
            // 인접 노드가 방문되지 않았다면
            if visited[nextNode] == 0 {
                // 방문 처리하고 큐에 추가
                queue.append(nextNode)
                visited[nextNode] = order
                order += 1
            }
        }
    }
}



// BFS 탐색 시작
bfs(startNode: R)
// 결과 출력

for i in visited[1...] {
    print(i)
}