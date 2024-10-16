import Foundation

let N = Int(readLine()!)!
let scores = readLine()!.split(separator: " ").compactMap { Int($0) }
let highestScore = scores.max()!
var newScores = [Double]()

for score in scores {
    let newScore = (Double(score) / Double(highestScore)) * 100
    newScores.append(newScore)
}

let answer = newScores.reduce(0, +) / Double(N)
print(answer)