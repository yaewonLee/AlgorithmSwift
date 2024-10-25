import Foundation

let T = Int(readLine()!)!
let directions = [
    (-2, -1), (-1, -2), (1, -2), (2, -1),
    (2, 1), (1, 2), (-1, 2), (-2, 1)
]

for _ in 0..<T {
    let L = Int(readLine()!)!
    let currentXY = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (currentX, currentY) = (currentXY[0], currentXY[1])
    let targetXY = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (targetX, targetY) = (targetXY[0], targetXY  [1])
    
    if (currentX, currentY) == (targetX, targetY) {
        print(0)
        continue
    }
    
    var queue = [(Int, Int, Int)]()
    queue.append((currentX, currentY, 0))
    
    var visited = Array(repeating: Array(repeating: false, count: L), count: L)
    visited[currentX][currentY] = true
    
    var found = false
    var front = 0
                
    while front < queue.count, !found {
        let (x, y, moves) = queue[front]
        front += 1
        
        for direction in directions {
            let nx = x + direction.0
            let ny = y + direction.1
            
            if (nx, ny) == (targetX, targetY) {
                found = true
                print(moves + 1)
                break
            }
            
            if nx >= 0, ny >= 0, nx < L, ny < L, !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append((nx, ny, moves + 1))
            }
        }
    }
}