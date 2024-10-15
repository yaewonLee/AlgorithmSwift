func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted { (str1, str2) -> Bool in
        let char1 = str1[str1.index(str1.startIndex, offsetBy: n)]
        let char2 = str2[str2.index(str2.startIndex, offsetBy: n)]
        
        if char1 == char2 {
            return str1 < str2
        }
        return char1 < char2
    }
}