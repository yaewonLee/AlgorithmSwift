import Foundation

var numbers = Set(1...30)

for _ in 1...28 {
    let number = Int(readLine()!)!
    numbers.remove(number)
}

for i in numbers.sorted() {
    print(i)
}