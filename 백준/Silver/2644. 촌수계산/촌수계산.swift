import Foundation

// 전체 사람의 수
let n = Int(readLine()!)!

// 촌수를 계산해야하는 서로 다른 사람의 번호
let targets = readLine()!.split(separator: " ").compactMap { Int($0) }
let (firstTarget, secondTarget) = (targets[0], targets[1])

// 부모 자식들간의 관계의 개수
let m = Int(readLine()!)!
// 간선정보 입력
var relationsGraph = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (x , y) = (input[0], input[1])
    
    relationsGraph[x].append(y)
    relationsGraph[y].append(x)
}

func bfs(start: Int, target: Int) -> Int {
    // 큐에 번호, 촌수 저장
    var queue = [(Int, Int)]()
    var visited = Array(repeating: false, count: n + 1)
    
    queue.append((start, 0))
    visited[start] = true
    
    while !queue.isEmpty {
        let (current, count) = queue.removeFirst()
        
        if current == target {
            return count
        }
        
        for neighbor in relationsGraph[current] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append((neighbor, count + 1))
            }
        }
    }
    return -1
}

print(bfs(start: firstTarget, target: secondTarget))