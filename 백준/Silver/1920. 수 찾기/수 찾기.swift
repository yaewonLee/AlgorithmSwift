import Foundation

let N = Int(readLine()!)!
let setA = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
let M = Int(readLine()!)!
let arrayM = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = [Int]()

for i in arrayM {
    if setA.contains(i) {
        result.append(1)
    } else {
        result.append(0)
    }
}

for i in result {
    print(i)
}