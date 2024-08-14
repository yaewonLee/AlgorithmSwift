import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var dict: [String: Int] = [:]
    var currentPlayers = players
    
    for (index, player) in players.enumerated() {
        dict[player] = index
    }

    for calling in callings {        
        let currentIndex = dict[calling]!
        
        // 추월 당한 선수의 인덱스
        let passedIndex = currentIndex - 1
        // 추월당한 선수
        let passedPlayer = currentPlayers[passedIndex]
        
        // 위치 교환
        currentPlayers[passedIndex] = calling
        currentPlayers[currentIndex] = passedPlayer
        
        // 딕셔너리에 반영
        dict[calling] = passedIndex
        dict[passedPlayer] = currentIndex        
    }        
    return currentPlayers
}