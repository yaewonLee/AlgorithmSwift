import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0], M = input[1]

var S = Set<String>()

for _ in 0..<N {
    let word = readLine()!
    S.insert(word)
}

var words = [String]()
for _ in 0..<M {
    let word = readLine()!
    words.append(word)
}

let result = words.filter { S.contains($0) }
print(result.count)