import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict: [Int: Int] = [:]
    
    for i in tangerine {
        dict[i, default: 0] += 1
    }
    
    let sortedDict = dict.values.sorted(by: >)
    var total = 0
    var kinds = 0
    
    for j in sortedDict {
        total += j
        kinds += 1
        
        if total >= k {
            break
        }
    }
    
    return kinds
}