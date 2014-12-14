struct Town {
    var mayor: Mayor = Mayor()
    var stopLights: Int = 4
    var population: Int = 4522 {
        didSet {
            var pops: (newPop: Int, oldPop: Int) = (newPop: population, oldPop: oldValue)
            mayor.respondToPopulationChange(pops)
        }
    }

    func printTownDescription(){
        println("Population: \(population), Stop Lights: \(stopLights)")
    }

    mutating func changPopulation(num: Int) {
        population += num
    }
}


struct Mayor {

    private var anxietyLevel = 0

    mutating func respondToPopulationChange(pops: (newPop: Int, oldPop: Int)) {
        if pops.newPop < pops.oldPop {
            println("The population has gone down.")
            ++anxietyLevel
        }
    }
}

var oxnard = Town()
oxnard.changPopulation(-5)
