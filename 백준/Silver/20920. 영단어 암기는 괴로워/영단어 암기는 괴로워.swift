import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0], M = input[1]
var list = [String:Int]()

for _ in 0..<N {
    let word = readLine()!
    if word.count >= M {
        list[word, default: 0] += 1
    }
}

var result = list.sorted {
    let (word1, count1) = $0
    let (word2, count2) = $1

    if count1 != count2 {
        return count1 > count2
    } else if word1.count != word2.count {
        return word1.count > word2.count
    } else {
        return word1 < word2
    }
}

for word in result {
    print(word.key)
}