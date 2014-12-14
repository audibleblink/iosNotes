# Beginning iOS w/ Swift

Notes from the Beginning iOS course from Big Nerd Ranch

## Table of Contents

|  Day | Playgrounds for Subjects Covered  |
|---|---|
| [Day 0](#day-0)  | [Arrays](./arrays.playground/section-1.swift), [Optionals](./optionals.playground/section-1.swift), [Dictionaries](./dictionaries.playground/section-1.swift), [Functions](./functions.playground/section-1.swift), [Closures](./closures.playground/section-1.swift), [Enumerations](./enumerations.playground/section-1.swift) |
|[Day 1](#day-1)| [Structs and Classes](./structsandclasses.playground/section-1.swift), [Currying](./currying.playground/section-1.swift)   |
|[Day 2](#day-2)||
|[Day 3](#day-3)||
|[Day 4](#day-4)||
|[Day 5](#day-5)||
|[Day 6](#day-6)||

## Teaching Notes
Collection of observations about Mikey's teaching styles

- "Ask me again if that's still unclear to you at the end of this lecture"
- "Case by case basis, which I'm happy to talk about as we encounter them"


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

Optional binding

```swift
var optionalInt: Int? // this can possibly be nil

if let x: Int = optionalInt { //this only fires if optionalInt is NOT nil
    //do something
}
```

Optional chaining

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


Named Paramters
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

Variadic Parameters
Multiple Arguments

```swift
func catchThemAll(pokemon: String...) {
}
```

Types
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

# Day 1

### Structs and Classes

Stucts cannot have sub-structs. Classes can have subclasses.
Struct are value types. Classes are reference types.

```swift
struct Body {
    var height: Double = Double()
    var weight: Double = Douvle()
    mutating func
}

Person Person {
var body: Body = Body()
}

var matt = Person()
matt.body.height = 60.0

class Employee: Person { // Employee is a type of Person
    var employeeId: Int = 0
}
```

If you pass in a struct to a function, that struct is copied. It's non-mutating.
'Pass by copy'

```swift
var b = Body()
b.wieght = 100
func disposeOf(aBody: Body,){
    aBody.weight = 0]
}

b.weight // returns 100, not 0

```


Identity

```swift
/// Struct

let p = Body()
let q = p

p === q // FALSE

/// Class

let p = Person()
let q = p

p === q // returns TRUE
```

### Properties

Computed property - It's like a method. (Without using bananas)

```swift
class Person {
    var body = Body()
    var bmi: Double {
        get {
            return body.weight / (body.weight * body.height)
        }
    }
}
// Another use-case. In an iOS app, NSUserDefaults allows k/v storage.
// On changing a property, like age, the logic can just read/write to
// NSUserDefaults and let it worry about the persistance.
```

Lazy Properties

```swift
class Person {
    var body = Body()
    var bmi: Double {
        get {
            return body.weight / (body.weight * body.height)
        }
    }
    lazy var passportPhoto: Photograph = {
        return loadPhotoForPerson(self)
    }
}
```

Property Observers
They watch properties for a change.
    - Everytime age is changed, a function runs, printing Happy Birthday to the console

```swift
class Person {
    var body = Body()
    var age: Int = 20 {
        didSet {
            println("Happy Birthday to you! You are no longer \(oldValue)") //oldValue is a freebie
        }
        willSet(newAge) {
            println("You are about to turn \(newAge)")
        }
    }
}

eddy = Person()
eddy.age++ // console prints "Happy Birthday to you! You are no longer 20"



```

Access Control(private methods/properties)

    - Public - Visible to all files in the module or those that import the module
    - Internal(default) - visible to all files in the same module
    - Private - visible only within its defining source file

```swift
public class Vampire: Monster {

    public var thrall: [Vampire]? = []
    private var parent: Vampire = Vampire()

    final override func terrorizeTown() {
        if town?.population >= 1 {
            town?.changePopulation(-1)
            self.thrall?.append(Vampire())
        } else {
            println("There is no one left tin the town!")
        }
    super.terrorizeTown()
    }

    lazy public var parentName: String  {
        get {
            return parent.name
        }
    }
}
```


