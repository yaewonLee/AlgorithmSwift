import Foundation

let n = Int(readLine()!)!
var paper = Array(repeating: Array(repeating: 0, count: 100), count: 100)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let x = input[0], y = input[1]
    
    for i in x..<(x+10) {
        for j in y..<(y+10) {
            paper[i][j] = 1
        }
    }
}

var area = 0

for i in paper {
    area += i.reduce(0, +)
}

print(area)