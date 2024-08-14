import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    let sortedA = A.sorted()
    let sortedB = B.sorted(by: >)
    var result = 0
    let n = sortedA.count
    print(sortedA, sortedB)
    for i in 0..<n {
        result += sortedA[i] * sortedB[i]
    }
    return result
}