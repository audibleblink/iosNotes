# Day 1

## Structs and Classes

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


__Identity__  

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

## Properties

__Computed property__  
It's like a method. (Without using bananas)

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

--Lazy Properties--  

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

__Property Observers__  
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


## Initializers

Compiler gives you an init() method. Class and Struct initializers are different

```swift
struct Point {
    let x: Double
    let y: Double

    // Freebie for structs
    //init(x: Double, y: Double) {
    //    self.x = x
    //    self.y = y
    //}

    //I can create another init that calls an init
    init(){
        self.init(x: 0, y:0) // calls the original memberwise init with default values
    }

}
```

__Class Initializers__  

Classes do not get a "freebie" init, and you must denote 'convenience for additional inits'  
Designated inits must call superclass inits  
Convenience inits must call an init from its own class  

```swift
class Player(isPro: Bool, name: String) {
    let isPro: Bool
    let name: String

    init(isAPro: Bool, playerName: String) {
        isPro = isAPro
        name = playerName
    }

    convenience init(playerName: String) { // calls the init 5 lines up; gets run if I only pass in a name when trying to init a Player
        self.init(isAPro: true, playerName: playerName)
    }
}
```

__Initializer Safety Steps__  

1. Initialize all your properties
2. Call Superclass initialize
3. Now "self" is usable
4. Your properties can be further modified

__Required Initializers__   
Force subclasses to use the parent class' init()

```swift
class Monster {
    let name: String
    var town: Town? = nil
    var victimPool: Int {
        get {
            return town?.population ?? 0 // set default 0 if population == nil
        }
        set(newVictimPool) { // named `newValue`
            town?.population = newVictimPool
        }
    }

    required init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }

}


class Zombie: Monster {
    class var spookyNoise: String { // class variable
        return "Brains..."
    }
    var walksWithLimp: Bool
    private var isFallingApart: Bool

    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }

    // this is the new 'designated initializer'
    required init(town: Town?, monsterName: String) { // only fires on first init, not through delegation
    // since there are no params for this, and we must use the init from 
    // the superclass and set our variables here
        walksWithLimp = false 
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }

}
```

__Deinitilization__  

Things to run when an object is destroyed

```swift
class MyClass: UIViewController {
    init {
        NSNotificationCenter.defaultCenter().addObserver(self, /*some code*/)
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
```            
