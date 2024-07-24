func isGroupWord(_ word: String) -> Bool {
    var seen: Set<Character> = []
    var previousChar: Character? = nil
    
    for char in word {
        if char != previousChar {
            if seen.contains(char) {
                return false
            }
            seen.insert(char)
        }
        previousChar = char
    }
    return true
}

func countGroupWords(_ words: [String]) -> Int {
    return words.filter{ isGroupWord($0) }.count
}

let N = Int(readLine()!)!
var words: [String] = []

for _ in 0..<N {
    if let word = readLine() {
        words.append(word)
    }
}

print(countGroupWords(words))