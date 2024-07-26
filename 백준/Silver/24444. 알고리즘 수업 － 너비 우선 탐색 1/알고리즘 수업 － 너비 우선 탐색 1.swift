import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], r = input[2]

var visited = [Int](repeating: 0, count: n + 1)
var graph = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0], v = edge[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

// bfs 정의
func bfs(start: Int) {
    var order = 1
    var queue = [start]
    visited[start] = order
    order += 1
    var index = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for nextNode in graph[node].sorted(by: <) {
            if visited[nextNode] == 0 {
                visited[nextNode] = order
                order += 1
                queue.append(nextNode)
            }
        }
    }
}

bfs(start: r)

for i in 1...n {
    print(visited[i])
}