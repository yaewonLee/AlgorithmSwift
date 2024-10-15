import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let n = Int(readLine()!)!
    var dict = [String: Int]()
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").compactMap { String($0) }
        let key = input[1]
        dict[key, default: 0] += 1
    }

    var combination = 1

    for i in dict.values {
        combination *= (i + 1)
    }

    print(combination - 1)
}