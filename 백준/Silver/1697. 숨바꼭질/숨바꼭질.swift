import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, K) = (input[0], input[1])

var distances = Array(repeating: -1, count: 100001)
var queue = [Int]()

queue.append(N)
distances[N] = 0

while !queue.isEmpty {
    let current = queue.removeFirst()
    
    if current == K {
        print(distances[current])
        break
    }
    
    for next in [current + 1, current - 1, current * 2] {
        if next >= 0, next <= 100000, distances[next] == -1 {
            queue.append(next)
            distances[next] = distances[current] + 1
        }
    }
}