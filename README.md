# Beginning iOS w/ Swift

Notes from the Beginning iOS course from Big Nerd Ranch

## Table of Contents

|  Day | Playgrounds for Subjects Covered  | 
|---|---|
| [Day 0](#day-0)  | [Arrays](./arrays.playground/section-1.swift), [Optionals](./optionals.playground/section-1.swift), [Dictionaries](./dictionaries.playground/section-1.swift) | 
|[Day 1](#day-1)||
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