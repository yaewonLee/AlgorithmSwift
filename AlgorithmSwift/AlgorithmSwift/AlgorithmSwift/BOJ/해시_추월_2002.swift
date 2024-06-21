//
//  해시_추월_2002.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 6/21/24.
//

import Foundation

/*
 <백준 실버-1>
 해시_추월_2002
 
 문제
 대한민국을 비롯한 대부분의 나라에서는 터널 내에서의 차선 변경을 법률로 금하고 있다. 조금만 관찰력이 있는 학생이라면 터널 내부에서는 차선이 파선이 아닌 실선으로 되어 있다는 것을 알고 있을 것이다. 이는 차선을 변경할 수 없음을 말하는 것이고, 따라서 터널 내부에서의 추월은 불가능하다.
 
 소문난 명콤비 경찰 대근이와 영식이가 추월하는 차량을 잡기 위해 한 터널에 투입되었다. 대근이는 터널의 입구에, 영식이는 터널의 출구에 각각 잠복하고, 대근이는 차가 터널에 들어가는 순서대로, 영식이는 차가 터널에서 나오는 순서대로 각각 차량 번호를 적어 두었다.
 
 N개의 차량이 지나간 후, 대근이와 영식이는 자신들이 적어 둔 차량 번호의 목록을 보고, 터널 내부에서 반드시 추월을 했을 것으로 여겨지는 차들이 몇 대 있다는 것을 알게 되었다. 대근이와 영식이를 도와 이를 구하는 프로그램을 작성해 보자.
 
 [입력]
 입력은 총 2N+1개의 줄로 이루어져 있다. 첫 줄에는 차의 대수 N(1 ≤ N ≤ 1,000)이 주어진다. 둘째 줄부터 N개의 줄에는 대근이가 적은 차량 번호 목록이 주어지고, N+2째 줄부터 N개의 줄에는 영식이가 적은 차량 번호 목록이 주어진다. 각 차량 번호는 6글자 이상 8글자 이하의 문자열로, 영어 대문자('A'-'Z')와 숫자('0'-'9')로만 이루어져 있다.
 
 같은 차량 번호가 두 번 이상 주어지는 경우는 없다.
 
 [출력]
 첫째 줄에 터널 내부에서 반드시 추월을 했을 것으로 여겨지는 차가 몇 대인지 출력한다.
 */

func solution() {
    var enterCarArray: [String] = []
    var exitCarArray: [String] = []
    var enteryDict: [String: Int] = [:]
    var overtakes: Int = 0
    
    // 1. 차의 대수 N 입력
    let N = Int(readLine()!)!
    
    // 2. 터널에 들어가는 순서대로 차량 입력 -> 배열에 저장
    for i in 0..<N {
        var number = readLine()!
        enterCarArray.append(number)
    }
    
    // 3. 나오는 순서대로 차량 입력 -> 배열 저장
    for i in 0..<N {
        var number = readLine()!
        exitCarArray.append(number)
    }
    
    // 4. 들어가는 순서 딕셔너리에 인덱스와 저장
    for (index, number) in enterCarArray.enumerated() {
        enteryDict[number] = index
    }
    
    // 5. 인덱스로 순서 비교하기
    for i in 0..<N {
        for j in i+1..<N {
            if enteryDict[exitCarArray[i]]! > enteryDict[exitCarArray[j]]! {
                overtakes += 1
                break
            }
        }
    }
    print(overtakes)
}
