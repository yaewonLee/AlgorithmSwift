import Foundation

let totalComputer = Int(readLine()!)!
let connectedComputer = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: totalComputer + 1)
var visited = [Bool](repeating: false, count: totalComputer + 1)

for _ in 0..<connectedComputer {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let u = input[0], v = input[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

func dfs(_ node: Int) -> Int {
    var count = 0
    visited[node] = true
    
    for currentNode in graph[node] {
        if !visited[currentNode] {
            count += 1
            count += dfs(currentNode)
        }
    }
    return count
}

print(dfs(1))
