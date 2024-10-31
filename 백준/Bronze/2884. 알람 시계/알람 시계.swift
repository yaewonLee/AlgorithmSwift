let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let hour = input[0]
let minute = input[1]

if (minute - 45) >= 0 {
    print("\(hour) \(minute - 45)")
} else {
    let newHour = (hour - 1) < 0 ? 23 : (hour - 1)
    print("\(newHour) \(minute + 15)")
}