func solution(_ numbers:[Int]) -> Int {
    var numSet = Set(0...9)
    
    for i in numbers {
        if numSet.contains(i) {
            numSet.remove(i)
        }
    }
    
    return numSet.reduce(0, +)
}
