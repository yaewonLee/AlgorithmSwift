import Foundation

func solution(_ s:String) -> [Int] {
    let trimmed = s.trimmingCharacters(in: CharacterSet(charactersIn: "{}"))
    let splitStrings = trimmed.components(separatedBy: "},{")
    let sets = splitStrings.map { part in
        part.split(separator: ",").compactMap { Int($0) }
    }

    
    let sortedSets = sets.sorted { $0.count < $1.count }
    
    var result = [Int]()
    var seen = Set<Int>()
    
    for set in sortedSets {
        for num in set {
            if !seen.contains(num) {
                result.append(num)
                seen.insert(num)
            }
        }
    }
    
    return result
}