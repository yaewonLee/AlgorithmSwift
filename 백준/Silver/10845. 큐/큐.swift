import Foundation

struct STQueue<T> {
    var stack1: [T] = []
    var stack2: [T] = []
    
    mutating func enqueue(element: T) {
        stack1.append(element)
    }
    
    mutating func dequeue() -> T? {
        if stack2.isEmpty {
            while let element = stack1.popLast() {
                stack2.append(element)
            }
        }
        return stack2.popLast()
    }
    
    func isEmpty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
    
    func peek() -> T? {
        return stack2.isEmpty ? stack1.first : stack2.last
    }
    
    func back() -> T? {
        return stack1.isEmpty ? stack2.first : stack1.last
    }
}

let N = Int(readLine()!)!
var queue = STQueue<Int>()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    switch input[0] {
    case "push":
        push(element: Int(input[1])!)
    case "pop":
        print(pop())
    case "size":
        print(size())
    case "empty":
        print(empty())
    case "front":
        print(front())
    case "back":
        print(back())
    default:
        break
    }
}

func push(element: Int) {
    queue.enqueue(element: element)
}

func pop() -> Int {
    return queue.dequeue() ?? -1
}

func size() -> Int {
    return queue.stack1.count + queue.stack2.count
}

func empty() -> Int {
    return queue.isEmpty() ? 1 : 0
}

func front() -> Int {
    return queue.peek() ?? -1
}

func back() -> Int {
    return queue.back() ?? -1
}