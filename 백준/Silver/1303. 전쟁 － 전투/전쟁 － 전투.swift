import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, M) = (input[0], input[1])
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var map = [[Character]]()

for _ in 0..<M {
    map.append(Array(readLine()!))
}

var visited = Array(repeating: Array(repeating: false, count: N), count: M)

func dfs(x: Int, y: Int, team: Character) -> Int {
    visited[x][y] = true
    var count = 1
    
    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy
        
        if nx >= 0, ny >= 0, nx < M, ny < N, !visited[nx][ny], map[nx][ny] == team {
            count += dfs(x: nx, y: ny, team: team)
        }
    }
    return count
}

var whitePower = 0
var bluePower = 0

for i in 0..<M {
    for j in 0..<N {
        if !visited[i][j] {
            let team = map[i][j]
            let count = dfs(x: i, y: j, team: team)
            let power = count * count
            
            if team == "W" {
                whitePower += power
            } else {
                bluePower += power
            }
        }
    }
}

print("\(whitePower) \(bluePower)")