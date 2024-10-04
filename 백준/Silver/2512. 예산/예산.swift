let N = Int(readLine()!)!
let regions = readLine()!.split(separator: " ").compactMap { Int($0) }
let max = Int(readLine()!)!

var start = 0
var end = regions.max()!
var answer = 0

while start <= end {
    var target = (start + end) / 2
    var total = 0
    
    for i in regions {
        if i >= target {
            total += target
        } else {
            total += i
        }
    }
    
    if total > max {
        end = target - 1
    } else {
        start = target + 1
        answer = target
    }
}

print(answer)