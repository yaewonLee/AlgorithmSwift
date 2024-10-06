class Solution {
    func romanToInt(_ s: String) -> Int {
    let romanValues: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    var total = 0
    let chars = Array(s)
    
    for i in 0..<chars.count {
        let currentVal = romanValues[chars[i]]!
        
        if i < chars.count - 1, let nextVal = romanValues[chars[i + 1]], currentVal < nextVal {
            // 현재 값이 다음 값보다 작으면 빼기
            total -= currentVal
        } else {
            // 그렇지 않으면 더하기
            total += currentVal
        }
    }   
    return total
    }   
}