import Foundation

let n = Int(readLine()!)!
var numbers = [Int]()

for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

// 1. 산술평균
let sum = numbers.reduce(0, +)
let mean = round(Double(sum) / Double(n))

// 2. 중앙값
let sortedNumbers = numbers.sorted()
let median = sortedNumbers[n / 2]

// 3. 최빈값
var frequency = [Int: Int]()
for number in numbers {
    frequency[number, default: 0] += 1
}

let maxFrequency = frequency.values.max()!
let mostFrequentNumbers = frequency.filter { $0.value == maxFrequency }.keys.sorted()
let mode = mostFrequentNumbers.count > 1 ? mostFrequentNumbers[1] : mostFrequentNumbers[0]

// 4. 범위
let range = sortedNumbers.last! - sortedNumbers.first!

print(Int(mean))
print(median)
print(mode)
print(range)