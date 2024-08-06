import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0], b = input[1], c = input[2], d = input[3], e = input[4], f = input[5]

let denominator = a * e - b * d
let x = (c * e - b * f) / denominator
let y = (a * f - c * d) / denominator

print("\(x) \(y)")