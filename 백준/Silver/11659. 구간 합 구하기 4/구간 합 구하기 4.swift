let NM = readLine()!.split(separator: " ").compactMap { Int($0) }
let (N, M) = (NM[0], NM[1])
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

// 누적합 생성
var prefixSum = Array(repeating: 0, count: N + 1)

for i in 1...N {
    prefixSum[i] = prefixSum[i - 1] + numbers[i - 1]
}

for _ in 0..<M {
    let ij = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (i, j) = (ij[0], ij[1])
    
    print(prefixSum[j] - prefixSum[i - 1])
}