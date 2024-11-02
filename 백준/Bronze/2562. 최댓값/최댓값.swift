import Foundation

var array = [Int]()

for _ in 0..<9 {
    let input = Int(readLine()!)!
    array.append(input)
}

let max = array.max()

for (index, value) in array.enumerated() {
    if value == max {
        print(value)
        print(index + 1)
    }
}