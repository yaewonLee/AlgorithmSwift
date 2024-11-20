while let input = readLine(), input != "0" {
    let reversed = String(input.reversed())
    if input == reversed {
        print("yes")
    } else {
        print("no")
    }
}