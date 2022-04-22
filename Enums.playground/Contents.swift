import UIKit
import Darwin

enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

func coinCount(amount: [Coin]) -> Int {
    var balance = 0
    for value in amount {
        balance += value.rawValue
    }
    return balance
}


enum Month: Int {
    case january = 1, february, march, april, may, june, july,
         august, september, october, november, december
    
    var monthTillSummer: Int {
        var monthLeft = Month.june.rawValue - self.rawValue
        if monthLeft < 0 {
            monthLeft += 12
        }
        return monthLeft
    }
}

enum Direction {
    case north
    case south
    case east
    case west
}

let movements: [Direction] = [.north, .north, .west, .south,
                              .west, .south, .south, .east, .east, .south, .east]

var location = (x: 0, y: 0)

for step in movements {
    switch step {
    case .east:
        location.x += 1
    case .north:
        location.y += 1
    case .west:
        location.x -= 1
    case .south:
        location.y -= 1
    }
}
