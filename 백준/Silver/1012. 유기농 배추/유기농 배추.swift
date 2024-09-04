import Foundation

let T = Int(readLine()!)!
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var graph = [[Int]]()
var visited = [[Bool]]()

for _ in 0..<T {
    let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
    // 가로, 세로, 배추 개수
    let M = inputs[0], N = inputs[1], K = inputs[2]
    graph = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    for _ in 0..<K {
        let xy = readLine()!.split(separator: " ").compactMap { Int($0) }
        let x = xy[0], y = xy[1]
        graph[y][x] = 1
    }
    
    visited = Array(repeating: Array(repeating: false, count: M), count: N)
    var result = 0
    
    for i in 0..<N {
        for j in 0..<M {
            if !visited[i][j] && graph[i][j] == 1 {
                dfs(x: i, y: j)
                result += 1
            }
        }
    }
    print(result)
}

func dfs(x: Int, y: Int) {
    visited[x][y] = true
    
    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy
        
        if nx >= 0, nx < graph.count, ny >= 0, ny < graph[0].count, !visited[nx][ny], graph[nx][ny] == 1 {
            dfs(x: nx, y: ny)
        }
    }
}