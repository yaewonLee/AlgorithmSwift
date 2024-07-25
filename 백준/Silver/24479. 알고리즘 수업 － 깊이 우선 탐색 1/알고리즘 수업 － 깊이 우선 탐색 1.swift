let input = readLine()!.split(separator: " ").map { Int($0)! }
// n: 정점의 수, m: 간선의 수, r: 시작 정점, (u, v): 간선 정보
let n = input[0], m = input[1], r = input[2]

// 정점이 방문된 순서 기록. 0번 인덱스는 사용하지 않기 위해 n + 1 ex) 정점 1의 방문 순서는 visited[1]에 저장
var visited = [Int](repeating: 0, count: n + 1)
// 인접 리스트 형태로 그래프를 표현하기 위함 ex) graph[1]은 정점 1에 인접한 정점들의 리스트가 저장됨
var graph = [[Int]](repeating: [], count: n + 1)

// 간선 정보 입력하기
for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0], v = edge[1]
    graph[u].append(v)
    graph[v].append(u)
}

var order = 1

// dfs 함수 정의
func dfs(node: Int) {
    visited[node] = order
    order += 1
    for nextNode in graph[node].sorted(by: <) {
        if visited[nextNode] == 0 {
            dfs(node: nextNode)
        }
    }
}

dfs(node: r)

for v in visited[1...] {
    print(v)
}