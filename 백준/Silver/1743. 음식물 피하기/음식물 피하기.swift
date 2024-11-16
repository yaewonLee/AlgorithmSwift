import Foundation

let NMK = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, M, K) = (NMK[0], NMK[1], NMK[2])

var grid = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

for _ in 0..<K {
    let coordinate = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (r, c) = (coordinate[0] - 1, coordinate[1] - 1)
    
    grid[r][c] = 1
}

func dfs(x: Int, y: Int) -> Int {
    var count = 1
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    visited[x][y] = true
    
    for direction in directions {
        let (nx, ny) = (x + direction.0, y + direction.1)
        
        if nx >= 0, ny >= 0, nx < N, ny < M, !visited[nx][ny], grid[nx][ny] == 1 {
            count += dfs(x: nx, y: ny)
        }
    }
    return count
}

var result = 0

for i in 0..<N {
    for j in 0..<M {
        if !visited[i][j], grid[i][j] == 1 {
            result = max(result, dfs(x: i, y: j))
        }
    }
}

print(result)