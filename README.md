# Beginning iOS w/ Swift

Notes from the Beginning iOS course from Big Nerd Ranch

## Table of Contents

|  Day | Subjects Covered  | Playgrounds |
|---|---|---|
| [Day 0](#day-0)  | Optionals, Arrays  |
|[Day 1](#day 1)|||
|[Day 2](Day 2)|||
|[Day 3](Day 3)|||
|[Day 4](Day 4)|||
|[Day 5](Day 5)|||
|[Day 6](Day 6)|||

## Teaching Notes
Collection of observations about teaching styles  

- "Ask me again if that's still unclear to you at the end of this lecture"
- "Case by case basis, which I'm happy to talk about as we encounter them"


# Day 0

### Optionals
* optionals types allow constants to be set to falsey values
	* this is denoted by adding a `?` to the end of a type declararion

Optionals can be modifed safely (or forcibly with a `!`)

```
var s: String?
s = "this is "
	
s? += "something" //appends if s is NOT nil
	
```

Optional binding

```
var optionalInt: Int? // this can possibly be nil

if let x: Int = optionalInt { //this only fires if optionalInt is NOT nil
    //do something
}
```

Optional chaining

```

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

```
var x: Int! = 3 // Every time I use x, it's being force unwrapped (x!)

```