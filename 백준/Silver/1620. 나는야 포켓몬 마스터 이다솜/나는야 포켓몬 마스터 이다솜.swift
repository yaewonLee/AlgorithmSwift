import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0], M = input[1]
var numberToName = [Int: String]()
var nameToNumber = [String: Int]()

for i in 1...N {
    let name = readLine()!
    numberToName[i] = name
    nameToNumber[name] = i
}

var result = [String]()

for j in 0..<M {
    let input = readLine()!
    if let number = Int(input) {
        result.append(numberToName[number]!)
    } else {
        result.append(String(nameToNumber[input]!))
    }
}

for answer in result {
    print(answer)
}
