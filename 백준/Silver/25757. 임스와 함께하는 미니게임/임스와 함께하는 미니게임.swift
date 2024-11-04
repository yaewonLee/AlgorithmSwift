let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let game = String(input[1])

let gameRequirements: [String: Int] = ["Y": 1, "F": 2, "O": 3]
let requiredPlayers = gameRequirements[game]!

var names = Set<String>()

for _ in 0..<N {
    let name = readLine()!
    names.insert(name)
}

let maxGames = names.count / requiredPlayers
print(maxGames)