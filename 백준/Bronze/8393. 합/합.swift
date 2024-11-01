import Foundation

let n = Int(readLine()!)!
let array = Array(1...n)
print(array.reduce(0, +))