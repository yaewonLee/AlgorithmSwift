import Foundation

let NX = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, X) = (NX[0], NX[1])
let A = readLine()!.split(separator: " ").compactMap { Int($0) }
let answerArray = A.filter { $0 < X }.compactMap { String($0) }

print(answerArray.joined(separator: " "))