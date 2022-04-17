import UIKit

struct IceCream {
    let name: String = "Plombir"
    lazy var ingredients: [String] = ["plombir", "waffle"]
}

struct Car {
  let make: String
  let color: String
    var tank: FuelTank
}

struct FuelTank {
    var level: Double {
        didSet {
            if level < 0 {
                level = 0
            }
            if level > 1 {
                level = 1
            }
            lowFuel = level < 0.1
        }
    }
    var lowFuel: Bool
}

var mazda = Car(make: "mazda", color: "red", tank: FuelTank(level: 1, lowFuel: false))
mazda.tank.level = 0.05
mazda.tank.lowFuel
