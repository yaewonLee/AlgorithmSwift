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
        if stack2.isEmpty {
            return stack1.first
        } else {
            return stack2.last
        }
    }
}

let input = Int(readLine()!)!
var array = Array(1...input)
var queue = STQueue<Int>()

for i in array {
    queue.enqueue(element: i)
}

while queue.stack1.count + queue.stack2.count > 1 {
    queue.dequeue()
    if let card = queue.dequeue() {
        queue.enqueue(element: card)
    }
}

print(queue.dequeue()!)