import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    
    if N < 4 {
        print("1")
        continue
    }
    
    var dp = Array(repeating: 0, count: N + 1)
                   
    dp[1] = 1
    dp[2] = 1
    dp[3] = 1
    
    for i in 4...N {
        dp[i] = dp[i - 2] + dp[i - 3]
    }    
    print(dp[N])    
}