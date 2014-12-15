# Day 0

### Optionals
* optionals types allow constants to be set to falsey values  
    * this is denoted by adding a `?` to the end of a type declararion  

Optionals can be modifed safely (or forcibly with a `!`)

```swift
var s: String?
s = "this is "

s? += "something" //appends if s is NOT nil

```

__Optional binding__  

```swift
var optionalInt: Int? // this can possibly be nil

if let x: Int = optionalInt { //this only fires if optionalInt is NOT nil
    //do something
}
```

__Optional chaining__  

```swift

var optionalString: Int? = "10"
var nextInt: Int?

if let s: String = optionalString {
    if let parsedInt: Int = s.toInt() {
        nextInt = parsedInt.successor()
    }
}

// The above can be shortened to:

nextInt = optinalString?.toInt()?.successor()

```

Implicitly Unwrapped Optionals

```swift
var x: Int! = 3 // Every time I use x, it's being force unwrapped (x!)

```

### Functions


__Named Paramters__   
Function can be written to accept raw parameter, or named parameter (like hashes in Ruby)

```swift
func greet(name: String, location: String) {
    println("Hi \(name) from \(location)")
}

greet("Alex", "Oxnard")


func greet(yourName name: String, yourLocation location: String) {
    println("Hi \(name) from \(location)")
}

greet(yourName: "Alex", yourLocation: "Oxnard")


// You can force both variable names to be equal

func greet(#name: String, #location: String) {
    println("Hi \(name) from \(location)")
}

```

__Variadic Parameters__  
Multiple Arguments

```swift
func catchThemAll(pokemon: String...) {
}
```

__Types__  
Types allow for function overloading. That is to say, you can have two functions that are  named the same, so long as their parameters take different types.

### Closures
Self contained functionality. A function is a named closure. This is kind of like a lambda in Ruby


```swift
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

// Full closure version
var evenNumbers = map(sortedNumbers, { (i: Int) -> Int in
    return i * 2
})

```

### Enumerations
TBD

