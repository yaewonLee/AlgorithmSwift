import Foundation

func numOfResidents(k: Int, n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
    
    //0층 초기화
    for i in 1...n {
        dp[0][i] = i
    }
    
    // dp 채우기
    for i in 1...k {
        for j in 1...n {
            dp[i][j] = dp[i][j-1] + dp[i-1][j]
        }
    }
    
    return dp[k][n]
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    print(numOfResidents(k: k, n: n))
}