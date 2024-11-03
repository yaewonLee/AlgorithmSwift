import Foundation

let N = Int(readLine()!)!
var dict = [Int: Int]()
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = Int(readLine()!)!

for i in array {
    dict[i, default: 0] += 1
}

print(dict[v] ?? 0)