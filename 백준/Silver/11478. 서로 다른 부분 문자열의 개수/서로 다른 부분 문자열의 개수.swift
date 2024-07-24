func makeSubstrings(_ word: String) -> Int {
    var uniqueSubstrings: Set<String> = []
    let length = word.count
    let wordArray = Array(word)
    
    for i in 0..<length {
        var subString = ""
        for j in i..<length {
            subString.append(wordArray[j])
            uniqueSubstrings.insert(subString)
        }
    }
        
    return uniqueSubstrings.count
}

let input = readLine()!
print(makeSubstrings(input))