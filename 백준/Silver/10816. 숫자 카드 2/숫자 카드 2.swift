import Foundation

let N = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").compactMap { Int($0) }
let M = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var dict = [Int: Int]()

for card in cards {
    dict[card, default: 0] += 1
}

let result = numbers.map { String(dict[$0] ?? 0)}
print(result.joined(separator: " "))