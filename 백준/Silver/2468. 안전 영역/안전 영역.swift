import Foundation

let N = Int(readLine()!)!
var array = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    array.append(input)
}

func dfs(x: Int, y: Int, height: Int) {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var count = 1
    
    visited[x][y] = true
    
    for direction in directions {
        let (nx, ny) = (x + direction.0, y + direction.1)
        
        if nx >= 0, ny >= 0, nx < N, ny < N, !visited[nx][ny], array[nx][ny] > height {
            dfs(x: nx, y: ny, height: height)
        }
    }
}

var maxHeight = array.flatMap { $0 }.max()!
var maxSafeArea = 0

for height in 0...maxHeight {
    visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var safeArea = 0
    
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j], array[i][j] > height {
                dfs(x: i, y: j, height: height)
                safeArea += 1
            }
        }
    }
    
    maxSafeArea = max(maxSafeArea, safeArea)
}

print(maxSafeArea)