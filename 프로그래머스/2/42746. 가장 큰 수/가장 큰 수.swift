import Foundation

func solution(_ numbers:[Int]) -> String {
    var stringArray = numbers.map { String($0) }
    var sortedArray = stringArray.sorted { $0 + $1 > $1 + $0 }
    var result = sortedArray.joined()
    
    return result.first == "0" ? "0" : result
}