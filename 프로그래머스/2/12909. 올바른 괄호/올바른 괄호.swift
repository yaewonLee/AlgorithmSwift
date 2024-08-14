import Foundation

func solution(_ s: String) -> Bool {
    var stack: [Character] = []
    
    for i in s {
        if i == "(" {
            stack.append(i)
        } else if i == ")" {
            if stack.isEmpty {
                return false
            }
            stack.popLast()
        }
    }
    
    return stack.isEmpty
}