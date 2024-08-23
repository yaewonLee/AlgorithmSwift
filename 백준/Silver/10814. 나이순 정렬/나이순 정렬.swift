import Foundation

struct Member {
    let index: Int
    let age: Int
    let name: String
}

let N = Int(readLine()!)!
var members = [Member]()

for i in 0..<N {
    let input = readLine()!.split(separator: " ")
    let age = Int(input[0])!, name = String(input[1])
    
    members.append(Member(index: i, age: age, name: name))
}

let sortedArray = members.sorted {
    if $0.age == $1.age {
        return $0.index < $1.index
    } else {
        return $0.age < $1.age
    }
}

for member in sortedArray {
    print(member.age, member.name)
}