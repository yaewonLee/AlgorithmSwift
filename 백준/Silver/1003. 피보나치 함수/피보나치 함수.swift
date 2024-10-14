import Foundation

let T = Int(readLine()!)!
var testCases = [Int]()

for _ in 0..<T {
    testCases.append(Int(readLine()!)!)
}

var dp = Array(repeating: (zeroCount: 0, oneCount: 0), count: 41)

dp[0] = (1, 0)
dp[1] = (0, 1)

for i in 2...40 {
    dp[i] = (dp[i - 1].zeroCount + dp[i - 2].zeroCount,
             dp[i - 1].oneCount + dp[i - 2].oneCount)
}

for testCase in testCases {
    let result = dp[testCase]
    print("\(result.zeroCount) \(result.oneCount)")
}