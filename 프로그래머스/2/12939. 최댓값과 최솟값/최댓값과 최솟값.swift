func solution(_ s:String) -> String {
    let array = s.split(separator: " ").compactMap { Int($0) }
    
    let min = array.min()!, max = array.max()!
    
    return "\(min) \(max)"
}