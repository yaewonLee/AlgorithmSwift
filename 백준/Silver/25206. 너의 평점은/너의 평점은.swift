import Foundation

let gradeToPoint: [String: Double] = [
    "A+": 4.5, "A0": 4.0, "B+": 3.5, "B0": 3.0,
    "C+": 2.5, "C0": 2.0, "D+": 1.5, "D0": 1.0, "F": 0.0
]

// 전공평점 = 과목별 (학점 X 과목평점) / 학접의 총합
var totalCredit = 0.0
var totalPoints = 0.0

for _ in 0..<20 {
    let input = readLine()!.split(separator: " ")
    let credit = Double(input[1])! // 학점
    let grade = String(input[2]) // 등급
    
    if grade == "P" {
        continue
    }
    
    // 학점의 총합
    totalCredit += credit
    // 과목별 (학점 X 과목평점)
    let point = gradeToPoint[grade]!
    totalPoints += point * credit
}

// 전공평점 계산
let gpa = totalPoints / totalCredit

// 전공평점 출력
print(String(format: "%.6f", gpa))