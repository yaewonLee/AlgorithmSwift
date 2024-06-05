//
//  Map, Filter, Reduce.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 6/5/24.
//

// - Map

// 데이터를 변형하고자 할 때 사용함
let numArray = [1,3,5,7,9]

/*
var multiArray = [Int]()
for num in numArray {
    multiArray.append(num * 2)
}
//print(multiArray)
// [2, 6, 10, 14, 18]
 */

let multiArray = numArray.map { $0 * 2 }
//print(multiArray)


// - Filter

let stringArray = ["가수", "대통령", "개발자", "선생님", "의사", "검사", "건물주"]
/*
var threeCountArray = [String]()
for st in stringArray {
    if st.count == 3 {
        threeCountArray.append(st)
    }
}
print(threeCountArray)
// ["대통령", "개발자", "선생님", "건물주"]
*/

let threeCountArray = stringArray.filter{ $0.count == 3}
//print(threeCountArray)

// Reduce

let number = [1, 2, 3, 4, 5]
 
let sum1 = number.reduce(0) { (result:Int, element: Int) -> Int in return result + element }
//print(sum1) //15
 
//추론으로 생략 가능
let sum2 = number.reduce(0) { (result, element) in result + element }
//print(sum2) //15
 
let sum3 = number.reduce(0) {$0 + $1}
//print(sum3) //15
 
let sum4 = number.reduce(1, +)
//print(sum4) //16

// 만일 initial(초기값) 값이 1이라면 초기 항목은 {1 + 1} 이다. 클로저는 이전 결과와 다음 항목을 계속 호출하여 다음과 같은 과정을 거쳐 하나의 값을 얻게 된다. {1 + 1}, {2 + 2}, {4 + 3}, {7 + 4}, {11 + 5}이며, 결과는 16이 된다.
