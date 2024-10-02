import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
// 나무의 수, 가져가야하는 나무의 길이
let N = input[0], M = input[1]
let treeHeights = readLine()!.split(separator: " ").compactMap { Int($0) }

func binerySearch(target: Int) {
    // mid는 목재절단기의 높이
    var start = 0
    var end = treeHeights.max()!
    var result = 0
    
    while start <= end {
        let mid = (start + end) / 2
        var collectedTrees = 0
        
        for tree in treeHeights {
            if tree > mid {
                collectedTrees += tree - mid
            }
        }
        
        if collectedTrees >= M {
            start = mid + 1
            result = mid
        } else {
            end = mid - 1
        }
    }
    print(result)
}

binerySearch(target: M)