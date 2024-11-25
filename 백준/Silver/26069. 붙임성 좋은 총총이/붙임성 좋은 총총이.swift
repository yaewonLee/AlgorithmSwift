let N = Int(readLine()!)!
var dancingPeople = Set<String>()
dancingPeople.insert("ChongChong")

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { String($0) }
    let (personA, personB) = (input[0], input[1])
    
    
    if dancingPeople.contains(personA) || dancingPeople.contains(personB) {
        dancingPeople.insert(personB)
        dancingPeople.insert(personA)
    }
}

print(dancingPeople.count)