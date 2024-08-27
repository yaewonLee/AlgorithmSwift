import Foundation

/*
삼각형 성립 조건: a + b > c
 */

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    if input == [0, 0, 0] {
        break
    }
    
    let a = input[0], b = input[1], c = input[2]
    
    if a + b <= c {
        print("Invalid")
    } else if a == b && b == c {
        print("Equilateral")
    } else if a == b || b == c {
        print("Isosceles")
    } else {
        print("Scalene")
    }
}