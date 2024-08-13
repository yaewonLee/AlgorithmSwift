import Foundation

func solution(_ s:String) -> Int {
    var stack: [Character] = []
    
    for char in s {
        if let last = stack.last, last == char {
            stack.popLast()
        } else {
            stack.append(char)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}