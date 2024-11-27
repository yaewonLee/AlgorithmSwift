func solution(_ seoul:[String]) -> String {
    var answer = 0
    for (i, value) in seoul.enumerated() {
        if value == "Kim" {
            answer = i
        }
    }
    return "김서방은 \(answer)에 있다"
}