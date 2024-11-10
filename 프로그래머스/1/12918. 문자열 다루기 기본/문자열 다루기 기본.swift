func solution(_ s: String) -> Bool {
    guard s.count == 4 || s.count == 6 else {
        return false
    }
    
    return s.allSatisfy { $0.isNumber }
}
