import Foundation

let N = Int(readLine()!)!
let P = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var sum = 0
var answer = 0

for i in P {
    sum += i
    answer += sum
}

print(answer)