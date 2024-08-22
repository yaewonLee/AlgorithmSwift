import Foundation

struct Stack<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    func peek() -> T? {
        return elements.last
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func size() -> Int {
        return elements.count
    }
}

let N = Int(readLine()!)!
var stack = Stack<Int>()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    switch input[0] {
    case 1:
        stack.push(input[1])
    case 2:
        print(stack.pop() ?? -1)
    case 3:
        print(stack.size())
    case 4:
        print(stack.isEmpty() ? 1 : 0)
    case 5:
        print(stack.peek() ?? -1)
    default:
        break
    }
}