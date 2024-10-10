import Foundation

let N = Array(readLine()!)
var dict = [Character: Int]()

for i in N {
    dict[i, default: 0] += 1
}

let answer: [Int] = dict.map { (key, value) -> Int in
    if key == "6" || key == "9" {
        let sixNineCount = Double(dict["6", default: 0] + dict["9", default: 0])
        return Int(ceil(sixNineCount / 2.0))
    } else {
        return value
    }
}

print(answer.max()!)