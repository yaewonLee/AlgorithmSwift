import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let numberOfA = input[0], numberOfB = input[1]

let A = Set(readLine()!.split(separator: " ").compactMap{ Int($0) })
let B = Set(readLine()!.split(separator: " ").compactMap{ Int($0) })

// 대칭 차집합을 구하는 메서드
print(A.symmetricDifference(B).count)
