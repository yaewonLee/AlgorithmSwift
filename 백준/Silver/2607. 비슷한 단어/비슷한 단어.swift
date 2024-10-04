import Foundation

func getCharacterFrequency(_ word: String) -> [Character: Int] {
    var frequency = [Character: Int]()
    for char in word {
        frequency[char, default: 0] += 1
    }
    return frequency
}

func areWordsSimilar(_ word1: String, _ word2: String) -> Bool {
    let len1 = word1.count
    let len2 = word2.count

    // 두 단어의 길이 차이가 2 이상이면 비슷한 단어가 될 수 없다
    if abs(len1 - len2) >= 2 {
        return false
    }

    let freq1 = getCharacterFrequency(word1)
    let freq2 = getCharacterFrequency(word2)

    var difference = 0

    // freq1에 있는 문자의 빈도수와 freq2를 비교
    for (char, count) in freq1 {
        let count2 = freq2[char, default: 0]
        difference += abs(count - count2)
    }

    // freq2에만 있는 문자 확인
    for (char, count) in freq2 {
        if freq1[char] == nil {
            difference += count
        }
    }

    // 차이가 2 이하일 경우 비슷한 단어로 판단
    return difference <= 2
}

func solution() {
    let n = Int(readLine()!)!
    var words = [String]()
    
    for _ in 0..<n {
        words.append(readLine()!)
    }
    
    // 첫 번째 단어와 비슷한 단어의 개수 계산
    let firstWord = words[0]
    var similarCount = 0

    for i in 1..<n {
        if areWordsSimilar(firstWord, words[i]) {
            similarCount += 1
        }
    }    
    print(similarCount)
}

solution()