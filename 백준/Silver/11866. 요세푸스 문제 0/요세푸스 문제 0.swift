import Foundation

let NK = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, K) = (NK[0], NK[1])

var queue = Array(1...N)
var result = [Int]()

while !queue.isEmpty {
    for _ in 0..<(K - 1) {
        let front = queue.removeFirst()
        queue.append(front)
    }
    result.append(queue.removeFirst())
}

let answer = result.map { String($0) }.joined(separator: ", ")

print("<\(answer)>")