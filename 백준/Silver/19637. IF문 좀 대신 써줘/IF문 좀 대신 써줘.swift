import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
// 칭호의 개수, 출력해야하는 캐릭터의 개수
let N = input[0], M = input[1]
var criterias = [(String, Int)]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    let criteria = String(input[0]), power = Int(input[1])!
    criterias.append((criteria, power))
}

func binerySearch(target: Int) -> String {
    // left, right, mid는 criterias의 인덱스 값들
    var left = 0
    var right = criterias.count - 1
    var result = ""
    
    while left <= right {
        let mid = (left + right) / 2
        if target <= criterias[mid].1 {
            result = criterias[mid].0
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return result
}

for _ in 0..<M {
    let input = Int(readLine()!)!
    print(binerySearch(target: input))
}