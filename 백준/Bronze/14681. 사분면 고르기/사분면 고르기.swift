import Foundation

let x = Int(readLine()!)!
let y = Int(readLine()!)!

if x > 0 && y > 0 {
    print(1)  // 제1사분면
} else if x < 0 && y > 0 {
    print(2)  // 제2사분면
} else if x < 0 && y < 0 {
    print(3)  // 제3사분면
} else if x > 0 && y < 0 {
    print(4)  // 제4사분면
}