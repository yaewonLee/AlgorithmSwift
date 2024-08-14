import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], K = input[1]

var queue: [Int] = Array(1...N)
var result = [Int]()
var index = 0

while !queue.isEmpty {
    index = (index + K - 1) % queue.count
    result.append(queue.remove(at: index))
}

print("<" + result.map { String($0) }.joined(separator: ", ") + ">")