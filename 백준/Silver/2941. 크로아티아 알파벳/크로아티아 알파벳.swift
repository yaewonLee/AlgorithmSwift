import Foundation

let croatianAlphabets = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
var words = readLine()!

for alphabet in croatianAlphabets {
    words = words.replacingOccurrences(of: alphabet, with: "1")
}

print(words.count)
