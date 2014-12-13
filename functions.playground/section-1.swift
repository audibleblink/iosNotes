// Playground - noun: a place where people can play

func sayHi() {
    println("Hi, I'm Swift!")
}


func greet(#name: String, #loc: String) { //octothorpes create named parameters of the same name
    sayHi()
    println("Hey there \(name) from \(loc)")
}


greet(name: "Alex", loc:"Oxnard")


/////////// Exercise //////////////

func beanSifter(#groceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    //must specify what the return will be
    
    var results = (beans:[String](), otherGroceries:[String]())
    
    for item in groceryList {
        
        item.hasSuffix("bean") ? results.beans.append(item) : results.otherGroceries.append(item)
        
    }
    
    return results
}


//////// Tests //////////

let result = beanSifter(groceryList: ["black bean","milk", "green bean", "pinto bean", "apples"])

assert(result.beans == ["black bean", "green bean", "pinto bean"], "Beans are sifted from groceries")
assert(result.otherGroceries == ["milk", "apples"], "Other non-bean groceries are present")

