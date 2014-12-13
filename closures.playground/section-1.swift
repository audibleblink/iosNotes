// Playground - noun: a place where people can play


let numbers = [0,2,4,6,3,5,7,9,8,1]

/// Sorting ///

func sortAscending(i: Int, j:Int) -> Bool{
    return i < j
}

// closure version of sortAscending
//{ (i: Int, j: Int) -> Bool in return (i < j) }


//var sortedNumber = sorted(numbers, sortAscending) //takes a function that return a Bool

//nameless function AKA closure
var sortedNumbers = sorted(numbers, { (i: Int, j: Int) in i < j })


// Full closure version
//var evenNumbers = map(sortedNumbers, { (i: Int) -> Int in
//    return i * 2
//})

/// Map ///

var evenNumbers = map(sortedNumbers, { (i: Int) in i * 2 }) // single line closure


// Map with Trailing Closure Syntax
var evenNumbers2 = map(numbers) { (i: Int) in i * 2 }


//returning functions

func printLineMaker(times: Int) -> String -> (){
    func printer(text: String){
        for _ in 1...times {
            println(text)
        }
    }
    return printer
}

let doWork = printLineMaker(5)
doWork("things")



/// Exercise ///

let nums = [2,4,3,5,1]
let sum = reduce(nums, 0, {(a: Int, b:Int) in a + b})
assert(sum == 15, "Sum of the `nums` array is 15")



















