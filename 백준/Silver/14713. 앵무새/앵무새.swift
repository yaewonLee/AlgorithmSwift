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
var queues: [STQueue<String>] = []

for _ in 0..<N {
    var queue = STQueue<String>()
    let words = readLine()!.split(separator: " ").map { String($0) }
    for word in words {
        queue.enqueue(element: word)
    }
    queues.append(queue)
}


var L = readLine()!.split(separator: " ").map { String($0) }

var isPossible = true
var lIndex = 0

while lIndex < L.count && isPossible {
    var found = false
    
    for i in 0..<N {
        if let frontWord = queues[i].peek(), frontWord == L[lIndex] {
            queues[i].dequeue()
            found = true
            break
        }
    }
    
    if !found {
        isPossible = false
    }
    
    lIndex += 1
}

for queue in queues {
    if !queue.isEmpty() {
        isPossible = false
        break
    }
}

print(isPossible ? "Possible" : "Impossible")