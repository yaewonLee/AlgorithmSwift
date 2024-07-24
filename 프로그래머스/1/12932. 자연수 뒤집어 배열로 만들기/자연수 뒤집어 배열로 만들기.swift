func solution(_ n:Int64) -> [Int] {
    let str = String(n)
    let reversedStr = String(str.reversed())    

    return reversedStr.compactMap{$0.wholeNumberValue}
}