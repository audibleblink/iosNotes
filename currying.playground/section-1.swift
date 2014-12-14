// Playground - noun: a place where people can play

import UIKit

func greet(name: String, salutation: String) -> String {
    return "\(salutation) \(name)"
}

greet("alex", "hello")

func greeter(salutation: String) -> (String) -> String {
    
    func greet(name: String) -> String {
        return "\(salutation) \(name)"
    }
    
    return greet //returns a function with the salutation prepopulated
}

let greetByName = greeter("Hello there")

greetByName("Alex")
