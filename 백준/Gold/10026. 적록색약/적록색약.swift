import Foundation

let N = Int(readLine()!)!
var painting = [[Character]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var colors = ["R", "G", "B"]

for _ in 0..<N {
    let input = Array(readLine()!)
    painting.append(input)
}

func dfs(x: Int, y: Int, color: Character, painting: [[Character]]) {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    visited[x][y] = true
    
    for direction in directions {
        let (nx, ny) = (x + direction.0, y + direction.1)
        
        if nx >= 0, ny >= 0, nx < N, ny < N, !visited[nx][ny], painting[nx][ny] == color {
            dfs(x: nx, y: ny, color: color, painting: painting)
        }
    }
}

var normalSight = 0

for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            dfs(x: i, y: j, color: painting[i][j], painting: painting)
            normalSight += 1
        }
    }
}

var colorBlindPainting = painting

for i in 0..<N {
    for j in 0..<N {
        if colorBlindPainting[i][j] == "G" {
            colorBlindPainting[i][j] = "R"
        }
    }
}

var colorBlindSight = 0
visited = Array(repeating: Array(repeating: false, count: N), count: N)

for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            dfs(x: i, y: j, color: colorBlindPainting[i][j], painting: colorBlindPainting)
            colorBlindSight += 1
        }
    }
}

print(normalSight, colorBlindSight)