import Foundation

struct Town {
    let region: String
    var numberOfStopLights: Int
    var population: Int {
        didSet {
            println("The population hash changed from \(oldValue) to \(population)")
        }
    }

    init(region: String, population: Int, stopLights: Int) {
        self.region = region
        self.population = population
        numberOfStopLights = stopLights
    } // This init is given by default, it is here for instructional purposes
    
    func townDescription() {
        println("Population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(num: Int) {
        population += num
    }
}

class Monster {
    let name: String
    var town: Town? = nil
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }

    init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }


    func terrorizeTown() {
        if let t = town {
            println("\(name) is terrorizing the town!")
        } else {
            println("\(name) hasn't found a town to terrorize yet.")
        }
    }
}


class Zombie: Monster {
    class var spookyNoise: String {
        return "Brains..."
    }
    var walksWithLimp: Bool
    private var isFallingApart: Bool

    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }

    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "")
    }

    convenience override init(town: Town?, monsterName: String) { 
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
    }
    override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(-10)
        }
    }
}

var myTown: Town? = Town(region: "CA", population: 42, stopLights: 4)
let fred = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
let bobby = Zombie(limp: false, fallingApart: true)
let lisa = Zombie(town: myTown, monsterName: "Lisa")

