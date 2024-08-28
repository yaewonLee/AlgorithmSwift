import Foundation

struct Country: Equatable {
    let country: Int
    let gold: Int
    let silver: Int
    let bronze: Int
    
    static func ==(_ lhs: Country, _ rhs: Country) -> Bool {
        return lhs.gold == rhs.gold && lhs.silver == rhs.silver && lhs.bronze == rhs.bronze
    }
}

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let K = input[1]

var countries = [Country]()
var kCountry: Country?

for _ in 1...N {
    let info = readLine()!.split(separator: " ").compactMap { Int($0) }
    let country = Country(country: info[0], gold: info[1], silver: info[2], bronze: info[3])
    countries.append(country)
    
    // K 국가의 메달 정보 저장
    if info[0] == K {
        kCountry = country
    }
}

countries.sort {
    if $0.gold != $1.gold {
        return $0.gold > $1.gold
    } else if $0.silver != $1.silver {
        return $0.silver > $1.silver
    } else {
        return $0.bronze > $1.bronze
    }
}

// 등수 계산
var rank = 1
var sameRank = 1 // 현재 국가와 이전 국가가 동일한 메달 수를 가질 때의 등수
var previousMedal = countries[0] // 첫 번째 국가의 메달 정보로 초기화

for i in 0..<N {
    let current = countries[i]
    
    // 이전 국가와 현재 국가의 메달 수가 다르면 현재 인덱스 + 1로 등수를 갱신
    if current != previousMedal {
        rank = i + 1
        sameRank = rank // 새로운 등수를 설정하므로 sameRank 갱신
    }
    
    // K 국가의 등수 찾기
    if current == kCountry {
        print(sameRank) // K 국가가 속한 공동 등수를 출력
        break
    }
    
    previousMedal = current // 이전 메달 정보 갱신
}