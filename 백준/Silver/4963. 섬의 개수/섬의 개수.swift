while true {
    let wh = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (w, h) = (wh[0], wh[1])
    
    if w == 0 && h == 0 {
        break
    }
    
    var grid = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var count = 0
    
    for _ in 0..<h {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        grid.append(input)
    }

    func dfs(x: Int, y: Int) {
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
        visited[x][y] = true

        for direction in directions {
            let (nx, ny) = (x + direction.0, y + direction.1)
            
            if nx >= 0, ny >= 0, nx < h, ny < w, !visited[nx][ny], grid[nx][ny] == 1 {
                dfs(x: nx, y: ny)
            }
        }
    }

    for i in 0..<h {
        for j in 0..<w {
            if !visited[i][j], grid[i][j] == 1 {
                dfs(x: i, y: j)
                count += 1
            }
        }
    }
    print(count)
}