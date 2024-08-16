import Foundation

let N = Int(readLine()!)!
var set = Set<String>()

for i in 0..<N {
    let input = readLine()!
    set.insert(input)
}

let sortedWords = set.sorted {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

for word in sortedWords {
    print(word)
}