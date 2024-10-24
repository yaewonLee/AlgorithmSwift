import Foundation

let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (M, N) = (input[0], input[1])
var boxes = [[Int]]()
var start = (0, 0)

for _ in 0..<N {
    let box = readLine()!.split(separator: " ").compactMap { Int($0) }
    boxes.append(box)
}

var queue = [(Int, Int)]()
var unripeTomatoes = 0

// 익은 토마토 위치들 큐에 추가
for i in 0..<N {
    for j in 0..<M {
        if boxes[i][j] == 1 {
            queue.append((i, j))
        } else if boxes[i][j] == 0 {
            unripeTomatoes += 1
        }
    }
}

if unripeTomatoes == 0 {
    print(0)
    exit(0)
}

var front = 0
var day = 0

while front < queue.count {
    // 오늘 하루 처리해야할 익은 토마토들 수
    let tomatoesToProcess = queue.count - front
    
    for _ in 0..<tomatoesToProcess {
        let current = queue[front]
        front += 1
        
        for direction in directions {
            let nx = current.0 + direction.0
            let ny = current.1 + direction.1
            
            if nx >= 0, ny >= 0, nx < N, ny < M, boxes[nx][ny] == 0 {
                boxes[nx][ny] = 1
                queue.append((nx, ny))
                unripeTomatoes -= 1
            }
        }
    }
    if front < queue.count {
        day += 1
    }
}

if unripeTomatoes == 0 {
    print(day)
} else {
    print(-1)
}