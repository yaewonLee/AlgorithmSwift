import Foundation

let input = readLine()!.split(separator: " ").compactMap { String($0) }
let a = Int(String(input[0].reversed()))
let b = Int(String(input[1].reversed()))

print(max(a!, b!))