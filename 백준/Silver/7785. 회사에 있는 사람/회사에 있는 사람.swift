import Foundation

let n = Int(readLine()!)!
var dict = [String: String]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let name = input[0], enterOrLeave = input[1]
    
    dict[name] = enterOrLeave
}

let result = dict.filter { $0.value == "enter"}.keys.sorted(by: >)

for name in result {
    print(name)
}