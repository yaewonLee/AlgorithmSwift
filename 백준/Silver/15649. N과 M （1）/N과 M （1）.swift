import Foundation

func backtracking(n: Int, m: Int, sequence: [Int] = [], visited: [Bool]) {
    if sequence.count == m {
        print(sequence.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if visited[i] {
            continue
        }
        var newVisited = visited
        newVisited[i] = true
        backtracking(n: n, m: m, sequence: sequence + [i], visited: newVisited)
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

let visited = [Bool](repeating: false, count: n + 1)

backtracking(n: n, m: m, visited: visited)