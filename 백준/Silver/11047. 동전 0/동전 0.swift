import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let K = input[1]
var coins: [Int] = []

for _ in 0..<N {
    coins.append(Int(readLine()!)!)
}

var remainingAmount = K
var requiredCoins = 0

for coin in coins.reversed() {
    if remainingAmount == 0 {
        break
    }
    
    if coin <= remainingAmount {
        let count = remainingAmount / coin
        requiredCoins += count
        remainingAmount -= count * coin
    }
}

print(requiredCoins)