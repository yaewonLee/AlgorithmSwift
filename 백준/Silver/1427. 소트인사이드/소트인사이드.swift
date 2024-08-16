import Foundation

let input = readLine()!.sorted(by: >).map { String($0) }
print(input.joined(separator: ""))
