var cache = [0, 1]
for i in 2...40 {
    cache.append(cache[i - 2] + cache[i - 1])
}

let n = Int(readLine()!)!

print(cache[n], n - 2)