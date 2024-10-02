import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var start = 1
    var end = n * times.max()!
    var answer = end
        
    while start <= end {
        var mid = (start + end) / 2
        var totalPeople = 0
        
        for time in times {
            totalPeople += mid / time
        }
        
        if totalPeople >= n {
            end = mid - 1
            answer = mid
        } else {
            start = mid + 1
        }
    }    
    return Int64(answer)
}