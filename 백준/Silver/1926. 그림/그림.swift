import Foundation

let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var graph = [[Int]]()
let size = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = size[0], m = size[1]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 0...n - 1 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph.append(input)
}

func dfs(x: Int, y: Int) -> Int {
    var count = 1
    visited[x][y] = true
    
    for (dx, dy) in directions {
        let nx = dx + x
        let ny = dy + y
        
        if nx >= 0, nx < n, ny >= 0, ny < m, !visited[nx][ny], graph[nx][ny] == 1 {
            count += dfs(x: nx, y: ny)
        }
    }
    return count
}

var result = [Int]()

for i in 0..<n {
    for j in 0..<m {
        if !visited[i][j], graph[i][j] == 1 {
            let size = dfs(x: i, y: j)
            result.append(size)
        }
    }
}

print(result.count)
print(result.max() ?? 0)