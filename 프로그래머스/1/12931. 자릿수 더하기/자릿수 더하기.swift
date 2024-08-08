import Foundation

func solution(_ n:Int) -> Int {
    return String(n).compactMap { $0.wholeNumberValue }.reduce(0, +)
}