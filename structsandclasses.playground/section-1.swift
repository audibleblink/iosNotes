// Playground - noun: a place where people can play

import UIKit

struct Town {
    var population = 9
    var numberOfStopLights = 4
    
    func townDescription() {
        println("Population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(num: Int) {
        population += num
    }
}

class Monster {
    var town: Town? = Town()
    var name = "Monster"
    
    func terrorizeTown() {
        if let t = town {
            println("\(name) is terrorizing the town!")
        } else {
            println("\(name) hasn't found a town to terrorize yet.")
        }
    }
}

class Zombie: Monster {
    var walksWithLimp = true
    
    final override func terrorizeTown() {
        if town?.population >= 10 {
            town?.changePopulation(-10)
        } else if town?.population > 0 {
            var toChange = town?.population
            town?.changePopulation(toChange! - (toChange! * 2))
        } else {
            println("There is no one lef tin the town!")
        }
        super.terrorizeTown()
    }
}

class Vampire: Monster {
    
    var thrall: [Vampire] = []
    override func terrorizeTown() {
        
        if town?.population >= 1 {
            town?.changePopulation(-1)
            var newVamp = Vampire()
            println(newVamp)
            self.thrall.append(newVamp)
        } else {
            println("There is no one lef tin the town!")
        }
        super.terrorizeTown()
    }
}


var fred = Zombie()
fred.town
fred.terrorizeTown()
fred.town
fred.terrorizeTown()

var dracula = Vampire()
dracula.town?.population = 1
dracula.town
dracula.thrall
dracula.terrorizeTown()
dracula.town
dracula.terrorizeTown()
dracula.thrall



