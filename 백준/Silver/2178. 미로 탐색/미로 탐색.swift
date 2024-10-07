import Foundation

struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count - head
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, M) = (input[0], input[1])

var maze = [[Int]]()

for i in 0..<N {
    let row = readLine()!.map { Int(String($0))! }
    maze.append(row)
}

// 배열 인덱스 기준 아래, 위, 오른, 왼
let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
var queue = Queue<(x: Int, y: Int)>()

queue.enqueue((0, 0))

while !queue.isEmpty {
    //현재 위치
    let current = queue.dequeue()!
    let (x, y) = (current.x, current.y)
    
    // 네 방향으로 이동 가능한지 확인
    for direction in directions {
        let (nx, ny) = (x + direction.0, y + direction.1)
        
        // 새로운 위치가 미로 범위 내에 있고, 이동 가능한 칸(1)인 경우
        if nx >= 0, ny >= 0, nx < N, ny < M, maze[nx][ny] == 1 {
            maze[nx][ny] = maze[x][y] + 1 // 현재 위치의 값에 1을 더하여 갱신
            queue.enqueue((nx, ny))
        }
    }
}

print(maze[N - 1][M - 1])