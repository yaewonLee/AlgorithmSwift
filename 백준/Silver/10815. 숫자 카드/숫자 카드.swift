import Foundation

let N = Int(readLine()!)!
var cards = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
let M = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

var result = numbers.map {cards.contains($0) ? "1" : "0"}
print(result.joined(separator: " "))