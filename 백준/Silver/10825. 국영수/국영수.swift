import Foundation

struct Student {
    let name: String
    let korean: Int
    let english: Int
    let math: Int
}

let N = Int(readLine()!)!
var students = [Student]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ")
    let name = String(input[0])
    let (korean, english, math) = (Int(input[1]), Int(input[2]), Int(input[3]))
    let newStudent = Student(name: name, korean: korean!, english: english!, math: math!)
    
    students.append(newStudent)
}

var answerArray = students.sorted {
    if $0.korean == $1.korean {
        if $0.english == $1.english {
            if $0.math == $1.math {
                return $0.name < $1.name
            }
            return $0.math > $1.math
        }
        return $0.english < $1.english
    }
    return $0.korean > $1.korean
}

for student in answerArray {
    print(student.name)
}