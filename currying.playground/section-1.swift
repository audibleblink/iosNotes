// Standard way of writing a greet function
func greet(name: String, salutation: String) -> String {
    return "\(salutation) \(name)"
}

greet("alex", "hello")


// Curried function
func greeter(salutation: String) -> (String) -> String { // greeter returns a function that takes a string. That returned function then returns a String

    func greet(name: String) -> String { // build the function that is to be returned
        return "\(salutation) \(name)" // name will be provided when this function is called later; outside of this greeter function
    }

    return greet //returns a function with the salutation prepopulated, takes a String; return a String
}

let greetByName = greeter("Hello there")

println( greetByName("Alex") )
