func checkFreqeuncy(_ input: String) -> Character {
    let loserCasedword = input.uppercased()
    var frequency:[Character: Int] = [:]
    
    for i in loserCasedword {
        frequency[i, default: 0] += 1
    }
    
    var mostFrequentAlphabet: Character?
    var isTie = false
    var maxCount = 0
    
    for (char, count) in frequency {
        if count > maxCount {
            maxCount = count
            mostFrequentAlphabet = char
            isTie = false
        } else if count == maxCount {
            isTie = true
        }
    }
    return isTie ? "?" : mostFrequentAlphabet!
}

if let input = readLine() {
    print(checkFreqeuncy(input))
}