import Foundation

func fib(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    
    var dp = [0 , 1]
    
    for i in 2...n {
        dp.append(dp[i - 1] + dp[i - 2])
    }
    
    return dp[n]
}

let n = Int(readLine()!)!

print(fib(n))