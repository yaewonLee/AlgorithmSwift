import Foundation

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var networkCount = 0

    for i in 0..<n {
        if !visited[i] {
            dfs(n: n, node: i, computers: computers, visited: &visited)
            networkCount += 1
        }
    }
    return networkCount
}

func dfs(n: Int, node: Int, computers: [[Int]], visited: inout [Bool]) {
    visited[node] = true

    for i in 0..<n {
        // 현재 컴퓨터가 node와 연결되어있고, 방문하지 않았을 경우
        if computers[node][i] == 1, !visited[i] {
            dfs(n: n, node: i, computers: computers, visited: &visited)
        }
    }
}
