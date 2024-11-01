import Foundation

let X = Int(readLine()!)!
let N = Int(readLine()!)!
var total = 0

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (price, count) = (input[0], input[1])
    total += price * count
}

print(total == X ? "Yes" : "No")