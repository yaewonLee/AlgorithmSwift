import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
let cards = readLine()!.split(separator: " ").map { Int($0)! }
var closestSum = 0

// 3장의 카드를 선택하는 모든 조합 확인하기
for i in 0..<N {
    for j in (i+1)..<N {
        for k in (j+1)..<N {
            let sum = cards[i] + cards[j] + cards[k]
            if sum <= M && sum > closestSum {
                closestSum = sum
            }
        }
    }
}

print(closestSum)