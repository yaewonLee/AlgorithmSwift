import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0], M = input[1]

var neverHeard = Set<String>()
var neverSeen = Set<String>()

for _ in 0..<N {
    neverHeard.insert(readLine()!)
}

for _ in 0..<M {
    neverSeen.insert(readLine()!)
}

let result = neverHeard.intersection(neverSeen).sorted()

print(result.count)
for name in result {
    print(name)
}