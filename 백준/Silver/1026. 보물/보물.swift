import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").compactMap { Int($0) }
let B = readLine()!.split(separator: " ").compactMap { Int($0) }

let sortedA = A.sorted(by: >)
let sortedB = B.sorted()

var sum = 0

for i in 0..<N {
    sum += sortedA[i] * sortedB[i]
}

print(sum)