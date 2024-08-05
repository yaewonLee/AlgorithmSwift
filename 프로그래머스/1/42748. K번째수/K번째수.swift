import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for command in commands {
        let i = command[0], j = command[1], k = command[2]
        let newArray = array[(i-1)..<j].sorted()
        result.append(newArray[k-1])
    }
    
    return result
}