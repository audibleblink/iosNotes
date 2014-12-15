// This is a Generic
// func map<U>(transform: (T) -> U) -> [U]

let nums = [1,2,3]

// passing map a closure
var newNums = nums.map({(i: Int) in
    i * 2    
})

// two curried functions that both return
// a closure with i prepopulated by #map

// func multiplyBy(factor: Int)(i: Int) -> Int { 
//     return i * factor
// }

func multiplyBy(factor: Int) -> (i: Int) -> Int {
    func thing(i: Int) -> Int {
        return factor * i
    }
    return thing
}

var curriedNums = nums.map(multiplyBy(2))

println(newNums)
println(curriedNums)
