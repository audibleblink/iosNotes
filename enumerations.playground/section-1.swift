// Playground - noun: a place where people can play

enum Days: String {
    case Sun = "Sunday"
    case Mon = "Monday"
    case Tue = "Tuesday"
    case Wed = "Wednesday"
    case Thu = "Thursday"
    case Fri = "Friday"
    case Sat = "Saturday"
}

var today = Days.Fri

switch today {
case .Fri:
    println("It's \(today.rawValue)")
    
case .Sat:
    println("It's Saturday!")
    
default:
    println("It's Flurbday!")
}


if let thisDay = Days(rawValue: "Friday"){
    println("Today is \(thisDay.rawValue)")
} else {
    println("There is no such day")
}
 /// Challenge ///

enum ShapeDimensions {
    case Square(Double)
    case Rectangle(len: Double, wdt: Double)
    case RightTri(width: Double, height: Double, hypot: Double)
    
    func perimiter() -> Double {
        switch self {
        case let .RightTri(width: a, height: b, hypot: c ):
            return a + b + c
        case let .Rectangle(len: l, wdt: w):
            return 2*l + 2*w
        case let .Square( side ):
            return side * 4        }
    }
    
    func area() -> Double {
        switch self {
        case let .Square(side):
            precondition(side >= 0, "Must be positive")
            return side * side
        case let .Rectangle(len: l, wdt: w):
            precondition(l >= 0, "Must be positive")
            precondition(w >= 0, "Must be positive")
            return l * w
        case let .RightTri(width: a, height: b, hypot: c ):
            precondition(a*a + b*b == c*c, "Not a valid Right Triangle")
            return a * b / 2
        }
    }
}

var triForce = ShapeDimensions.RightTri(width: 3.0, height: 4.0, hypot: 5.0)

triForce.area()
triForce.perimiter()
