import Foundation

func solution(_ n:Int) -> Int {
    var result = n + 1
    
    while true {
        if result.nonzeroBitCount == n.nonzeroBitCount {
            break
        }
        result += 1
    }
    return result
}