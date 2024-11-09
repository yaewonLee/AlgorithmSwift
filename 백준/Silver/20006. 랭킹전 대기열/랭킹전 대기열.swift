import Foundation

let pm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (p, m) = (pm[0], pm[1])

struct Room {
    var players: [(Int, String)]
    let levelRange: ClosedRange<Int>
    let capacity: Int
    
    var isFull: Bool {
        return players.count >= capacity
    }
    
    mutating func addPlayer(level: Int, nickname: String) {
        players.append((level, nickname))
    }
}

var rooms: [Room] = []

for _ in 0..<p {
    let input = readLine()!.split(separator: " ")
    let level = Int(input[0])!
    let nickname = String(input[1])
    
    var matched = false
    for i in 0..<rooms.count {
        if !rooms[i].isFull && rooms[i].levelRange.contains(level) {
            rooms[i].addPlayer(level: level, nickname: nickname)
            matched = true
            break
        }
    }
    
    if !matched {
        let newRoom = Room(players: [(level, nickname)], levelRange: (level-10)...(level+10), capacity: m)
        rooms.append(newRoom)
    }
}

for room in rooms {
    if room.isFull {
        print("Started!")
    } else {
        print("Waiting!")
    }
    
    let sortedPlayers = room.players.sorted { $0.1 < $1.1 }
    for player in sortedPlayers {
        print("\(player.0) \(player.1)")
    }
}