// Playground - noun: a place where people can play

import UIKit

//var a: Int? = 0
//var b: Int  = 1
//
//a! + b

var schroedingersVariable: Int? = nil

println("Given a default value of 0, calling a null optional results in 0... \(  (schroedingersVariable ?? 0) == 0  )") // this is called nil coallition


// Optional assignment

var s: String?
var n: String?

s = "this is "
n = nil

s? += "a thing" //appends if s is NOT nil
n? += "this is a thing" //returns nil and doesn't try to append a string to nil.




// Optional binding

//var optionalInt: Int? // this can possibly be nil
var optionalInt: Int? = 42

if let x: Int = optionalInt {          //this only fires if optionalInt is NOT nil
    println("x is not nil here, it's actually \(x)")
} else {                               // this runs because x is nil
    println("x in here is nil")
}





// Optional chaining

var optionalString: String? = "10"
var nextInt: Int?

if let s: String = optionalString {
    if let parsedInt: Int = s.toInt() {
        nextInt = parsedInt.successor()
    }
}

// The above can be shortened to:

nextInt = optionalString?.toInt()?.successor()

