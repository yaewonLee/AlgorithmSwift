import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    return dfs(numbers, target, 0, 0)
}

func dfs(_ numbers: [Int], _ target: Int, _ index: Int, _ currentSum: Int) -> Int {
    if index == numbers.count {
        return currentSum == target ? 1 : 0
    }
    
    let add = dfs(numbers, target, index + 1, currentSum + numbers[index])
    let subtract = dfs(numbers, target, index + 1, currentSum - numbers[index])
    
    return add + subtract
}
