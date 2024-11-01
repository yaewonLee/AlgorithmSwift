let T = Int(readLine()!)!

for _ in 0..<T {
    let AB = readLine()!.split(separator: " ").compactMap { Int($0) }
    print(AB[0] + AB[1])
}