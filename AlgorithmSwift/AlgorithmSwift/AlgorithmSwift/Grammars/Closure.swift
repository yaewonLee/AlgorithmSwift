//
//  Closure.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 6/4/24.
//

import Foundation

// - Closure

import Foundation

/*
{(Parameter) -> Return Type in
    실행구문
}
*/

// 1-1. 파라미터와 리턴타입이 둘 다 없는 경우
let closure = { () -> () in
    print("Closure")
}

// 1-2. 둘 다 있는 경우
let closure1 = { (name: String) -> String in
    return "Hello, \(name)"
}

// 2-1. 함수의 파라미터 타입으로 클로저를 전달할 수 있음
func doSomething(closure: () -> ()) {
    closure()
}

//2-2.
doSomething(closure: { () -> () in
    print("Hello!")
})

// 3. 함수의 반환타입으로 사용할 수 있음

func doSomething() -> () -> () {
    return { () -> () in
        print("Hello!")
    }
}
doSomething {}

// 4-1. 클로저가 대입된 변수나 상수로 호출하기
let closure3 = { () -> String in
    return "Hello"
}

//closure3()

// 4-2. 클로저를 직접 실행하기
({ () -> () in
    print("Hello")
})()


// 클로저 경량 문법
func doSomething(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

// 파라미터와 리턴 형식 생략 가능
doSomething(closure: { (a, b, c) in
    return a + b + c
})

// 경량 문법 규칙
doSomething(closure: {
    return $0 + $1 + $2
})

// 위와 같이 return이 하나만 남은 경우 그마저도 생략 가능
doSomething(closure: {
     $0 + $1 + $2
})

// 클로저의 파라미터가 마지막 파라미터라면 트레일링 클로저로 작성한다
doSomething() {
     $0 + $1 + $2
}

// 또한 파라미터가 하나면 () 생략 가능
doSomething {
     $0 + $1 + $2
}
