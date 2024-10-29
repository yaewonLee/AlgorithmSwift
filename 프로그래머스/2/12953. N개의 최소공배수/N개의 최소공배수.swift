func solution(_ arr:[Int]) -> Int {
    return arr.reduce(arr[0]) { lcm($0, $1) }
}

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}