import Foundation

let S = readLine()!
var countDict: [Character: Int] = ["0": 0, "1": 0]

for char in S {
    countDict[char, default: 0] += 1
}

let requiredZero = countDict["0"]! / 2
let requiredOne = countDict["1"]! / 2

print(String(repeating: "0", count: requiredZero) + String(repeating: "1", count: requiredOne))