struct Circle {
    
    var radius = 0.0
    
    var area: Double {
        get {
            .pi * radius * radius
        }
        set {
            radius = (newValue / .pi).squareRoot()
        }
    }
    
    mutating func grow(byFactor factor: Double) {
        area *= factor
    }
}

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
    var month: String
    var day: Int
    
    var totalDaysInCurrentMonth: Int {
        switch month {
        case "January", "March", "May", "July", "August", "October", "December":
            return 31
        case "April", "June", "September", "November":
            return 30
        case "February":
            return 28
        default:
            return 0
        }
    }
    
    mutating func advance() {
        if day == totalDaysInCurrentMonth {
            if month == "December" {
                month = "January"
            } else {
                month = months[months.firstIndex(of: month)!.advanced(by: 1)]
            }
            day = 1
        } else {
            day += 1
        }
    }
}

var date = SimpleDate(month: "December", day: 31)
date.advance()
date.month // January
date.day // 1

struct Math {
    // 1
    static func factorial(of number: Int) -> Int {
        // 2
        (1...number).reduce(1, *)
    }
}
// 3
Math.factorial(of: 6) // 720

extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        // 1
        var remainingValue = value
        // 2
        var testFactor = 2
        var primes: [Int] = []
        // 3
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
    
    static func isOdd(of value: Int) -> Bool {
        (value + 1) % 2 == 0
    }
    
    static func isEven(of value: Int) -> Bool {
        value % 2 == 0
    }
}

Math.isOdd(of: 31)
Math.isEven(of: 30)

extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
    var isOdd: Bool {
        (self + 1) % 2 == 0
    }
}


