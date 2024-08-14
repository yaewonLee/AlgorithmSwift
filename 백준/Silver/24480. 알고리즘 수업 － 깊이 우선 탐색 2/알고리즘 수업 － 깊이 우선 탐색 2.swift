import Foundation

// 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], r = input[2]

var visited = [Int](repeating: 0, count: n + 1)
var graph = [[Int]](repeating: [], count: n + 1)

// 간선 정보 넣기
for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0], v = edge[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

var order = 1

// dfs 정의하기
func dfs(node: Int) {
    // visted 방문 처리
    visited[node] = order
    // 다음 order로 이동
    order += 1
    // graph 내림차순 처리
    for nextNode in graph[node].sorted(by: >) {
        // 방문하지 않은 정점이라면 방문 처리
        if visited[nextNode] == 0 {
            dfs(node: nextNode)
        }
    }
}

dfs(node: r)

for i in visited[1...] {
    print(i)
}