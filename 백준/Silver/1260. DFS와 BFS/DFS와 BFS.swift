import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)!}
// 정점, 간선, 시작 정점
let N = input[0], M = input[1], V = input[2]
var graph = [[Int]](repeating: [], count: N + 1)

// 간선 정보 저장
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)!}
    let u = input[0], v = input[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

for i in 1...N {
    graph[i].sort()
}

// dfs
var visitedDFS = [Bool](repeating: false, count: N + 1)
var resultDFS = [Int]()

func dfs(_ node: Int) {
    visitedDFS[node] = true
    resultDFS.append(node)
    
    for currentNode in graph[node] {
        if !visitedDFS[currentNode] {
            dfs(currentNode)
        }
    }
}

// bfs
var visitedBFS = [Bool](repeating: false, count: N + 1)
var resultBFS = [Int]()

func bfs(_ startNode: Int) {
    var queue = [startNode]
    visitedBFS[startNode] = true
    var currentIndex = 0
    
    while currentIndex < queue.count {
        let currentNode = queue[currentIndex]
        currentIndex += 1
        resultBFS.append(currentNode)
        
        for nextNode in graph[currentNode] {
            if !visitedBFS[nextNode] {
                visitedBFS[nextNode] = true
                queue.append(nextNode)
            }
        }
    }
}

dfs(V)
bfs(V)

let dfsResult = resultDFS.map { String($0) }.joined(separator: " ")
let bfsResult = resultBFS.map { String($0) }.joined(separator: " ")

print(dfsResult)
print(bfsResult)