import Foundation

let N = Int(readLine()!)!

if N == 1 || N == 2 {
    print(1)
    exit(0)
}

var dp = Array(repeating: 0, count: N + 1)
dp[1] = 1
dp[2] = 1

if N >= 3 {
    for i in 3...N {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
}

print(dp[N])