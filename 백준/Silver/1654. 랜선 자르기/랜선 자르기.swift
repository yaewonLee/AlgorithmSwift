import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (K, N) = (input[0], input[1])
var lines = [Int]()

for _ in 0..<K {
    let line = Int(readLine()!)!
    lines.append(line)
}

var start = 1
var end = lines.max()!
var answer = 0

while start <= end {
    var totalLines = 0
    let mid = (start + end) / 2
    
    for line in lines {
        totalLines += (line / mid)
    }
    
    if totalLines >= N {
        answer = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(answer)