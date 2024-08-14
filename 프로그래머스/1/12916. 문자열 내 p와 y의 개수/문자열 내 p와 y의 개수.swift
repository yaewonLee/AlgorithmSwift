import Foundation

func solution(_ s:String) -> Bool {
    var array = s.uppercased()
    var dict: [Character: Int] = [:]
    
    for i in array {
        dict[i, default: 0] += 1
    }
    
    return dict["P"] == dict["Y"]
}