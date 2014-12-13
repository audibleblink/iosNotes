// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func sayHi() {
    println("Hi, I'm Swift!")
}

func greet(#name: String, #loc: String) { //octothorpes create named parameters of the same name
    sayHi()
    println("Hey there \(name) from \(loc)")
}

greet(name: "Alex", loc:"Oxnard")

/////////////////////////

func beanSifter(#groceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    
    var results = (beans:[String](), otherGroceries:[String]())
    
    for item in groceryList {
        item.hasSuffix("bean") ? results.beans.append(item) : results.otherGroceries.append(item)
    }
    
    return results
}

let result = beanSifter(groceryList: ["black bean",
                         "milk",
                         "green bean",
                         "pinto bean",
                         "apples"])




//////// Tests //////////

//func assertString(actual: String, expected: String, message: String) {
//    println("Test: \(message), \(expected == actual)")
//}
//
//
//func assertInt(actual: Int, expected: Int, message: String) {
//    println("Test: \(message), \(expected == actual)")
//}
//
//
//assertInt(1, 1, "One should be equal to one")


var expectedBeans = ["black bean", "green bean", "pinto bean"]
var expectedLeftovers = ["milk", "apples"]

println("Beans are sifted from groceries... \(result.beans == expectedBeans)")
println("Other non-bean groceries are present... \(result.otherGroceries == expectedLeftovers)")
