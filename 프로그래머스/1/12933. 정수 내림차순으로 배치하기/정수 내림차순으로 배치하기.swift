func solution(_ n:Int64) -> Int64 {
    var array = String(n).sorted(by: >)
    var result = ""
    
    for i in array {
        result += String(i)
    }
    return Int64(result)!
}