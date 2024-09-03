import Foundation

let N = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<N {
    let input = readLine()!.compactMap { Int(String($0)) }
    graph.append(input)
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)

// 방향 벡터 [상, 하, 좌, 우]
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

func dfs(_ x: Int, _ y: Int) -> Int {
    visited[x][y] = true
    var count = 1
    
    for (dx, dy) in directions {
        // nx, ny = 이동 완료 후 위치
            let nx = x + dx
            let ny = y + dy
            
            // 유효한 범위 내에서 아직 방문하지 않았고, 집이 있는 경우에만 탐색
            if nx >= 0, nx < N, ny >= 0, ny < N, !visited[nx][ny], graph[nx][ny] == 1 {
                count += dfs(nx, ny)  // 재귀 호출로 연결된 집 탐색
            }
        }
    return count
}

var complexes = [Int]()

for i in 0..<N {
    for j in 0..<N {
        if graph[i][j] == 1 && !visited[i][j] {
            // 새로운 단지를 발견하면 DFS로 탐색
            let size = dfs(i, j)
            complexes.append(size)
        }
    }
}

print(complexes.count)
for i in complexes.sorted() {
    print(i)
}