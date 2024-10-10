import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, M) = (input[0], input[1])
var graph = Array(repeating: [Int](), count: N + 1)
var visited = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v) = (edge[0], edge[1])
    
    graph[u].append(v)
    graph[v].append(u)
}

func dfs(node: Int) {
    visited[node] = true
    
    for i in graph[node] {
        if !visited[i] {
            dfs(node: i)
        }
    }
}

var result = 0
for i in 1...N {
    if !visited[i] {
        dfs(node: i)
        result += 1
    }
}

print(result)