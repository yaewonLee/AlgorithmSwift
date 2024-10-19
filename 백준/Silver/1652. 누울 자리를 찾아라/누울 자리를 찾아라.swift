import Foundation

let N = Int(readLine()!)!
var room = [[Character]]()

for _ in 0..<N {
    let row = Array(readLine()!)
    room.append(row)
}

var horizontalCount = 0
var verticalCount = 0

// 가로로 누울 수 있는 자리
for i in 0..<N {
    var count = 0
    for j in 0..<N {
        if room[i][j] == "." {
            count += 1
        } else {
            if count >= 2 {
                horizontalCount += 1
            }
            count = 0
        }
    }
    if count >= 2 {
        horizontalCount += 1
    }
}

// 세로로 누울 수 있는 자리
for j in 0..<N {
    var count = 0
    for i in 0..<N {
        if room[i][j] == "." {
            count += 1
        } else {
            if count >= 2 {
                verticalCount += 1
            }
            count = 0
        }
    }
    if count >= 2 {
        verticalCount += 1
    }
}

print(horizontalCount, verticalCount)
