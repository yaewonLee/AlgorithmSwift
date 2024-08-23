import Foundation

let N = Int(readLine()!)!
let X = readLine()!.split(separator: " ").map { Int($0)! }
let sortedX = Array(Set(X)).sorted()
var dict = [Int: Int]()

for (index, value) in sortedX.enumerated() {
    dict[value] = index
}

print(X.map { String(dict[$0]!) }.joined(separator: " "))