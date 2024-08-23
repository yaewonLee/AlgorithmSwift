import Foundation

struct XY {
    let x: Int
    let y: Int
}

let N = Int(readLine()!)!
var array = [XY]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    array.append(XY(x: input[0], y: input[1]))
}

let sortedArray = array.sorted {
    $0.y == $1.y ? $0.x < $1.x : $0.y < $1.y
}

for i in sortedArray {
    print(i.x, i.y)
}