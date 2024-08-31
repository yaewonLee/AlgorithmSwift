import Foundation

let P = Int(readLine()!)!

for _ in 0..<P {
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    let T = arr[0]
    var total = 0

    // 버블 정렬
    for i in 1..<arr.count - 1 {
        for j in i + 1..<arr.count {
            if arr[i] > arr[j] {
                arr.swapAt(i, j)
                total += 1
            }
        }
    }
    print(T, total)
}
