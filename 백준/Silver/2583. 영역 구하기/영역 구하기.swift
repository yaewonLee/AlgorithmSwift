import Foundation

let MNK = readLine()!.split(separator: " ").compactMap { Int($0) }
let (M, N, K) = (MNK[0], MNK[1], MNK[2])

var grid = Array(repeating: Array(repeating: 0, count: N), count: M)
var visited = Array(repeating: Array(repeating: false, count: N), count: M)
for _ in 0..<K {
    let coordinate = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (x1, y1, x2, y2) = (coordinate[0], coordinate[1], coordinate[2], coordinate[3])
    
    for i in x1..<x2 {
        for j in y1..<y2 {
            grid[j][i] = 1
        }
    }
}

func dfs(x: Int, y: Int) -> Int {
    var count = 1
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    visited[x][y] = true
    
    for direction in directions {
        let (nx, ny) = (x + direction.0, y + direction.1)
        
        if nx >= 0, ny >= 0, nx < M, ny < N, !visited[nx][ny], grid[nx][ny] == 0 {
            count += dfs(x: nx, y: ny)
        }
    }
    return count
}

var area = 0
var result = [Int]()

for i in 0..<M {
    for j in 0..<N {
        if !visited[i][j], grid[i][j] == 0 {
            result.append(dfs(x: i, y: j))
            area += 1
        }
    }
}

print(area)
print(result.sorted().map { String($0)}.joined(separator: " "))