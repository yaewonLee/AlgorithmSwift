import Foundation

/* 한수 -> 각 자리가 등차수열인 것
 1 ~ 99는 무조건 한수
*/

let N = Int(readLine()!)!

if N < 100 {
    print(N)
} else {
    var count = 0
    for i in 100...N {
        // 추출
        let hundreds = i / 100
        let ten = (i / 10) % 10
        let unit = i % 10
        
        if (hundreds - ten) == (ten - unit) {
            count += 1
        }
    }
    print(99 + count)
}