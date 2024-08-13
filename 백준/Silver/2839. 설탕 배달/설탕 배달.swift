func solution() -> Int {
    var n = Int(readLine()!)!
    
    var count5kgBags = n / 5
    
    while count5kgBags >= 0 {
        let remainingWeight = n - (count5kgBags * 5)
        
        if remainingWeight % 3 == 0 {
            let count3kgBags = remainingWeight / 3
            return count5kgBags + count3kgBags
        }
        
        count5kgBags -= 1
    }
    
    return -1
}

print(solution())