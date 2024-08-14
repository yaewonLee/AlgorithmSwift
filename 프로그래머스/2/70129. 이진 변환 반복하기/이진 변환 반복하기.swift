import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var changeCount = 0
    var zeroCount = 0
    
    while s != "1" {
        changeCount += 1
        
        let zero = s.filter { $0 == "0" }.count
        zeroCount += zero
        
        let numberOfOne = s.filter { $0 == "1" }.count
        s = String(numberOfOne, radix: 2)
    }
        
    return [changeCount, zeroCount]
}