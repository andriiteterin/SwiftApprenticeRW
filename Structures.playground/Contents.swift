struct Coordinate {
    let x: Int
    let y: Int
}

struct Ship {
    let origin: Coordinate
    let direction: String
    let length: Int
    
    func isHit(coordinate: Coordinate) -> Bool {
        if direction == "Right" {
            return origin.y == coordinate.y &&
                    coordinate.x >= origin.x &&
                    coordinate.x - origin.x < length
        } else {
            return origin.x == coordinate.x &&
                   coordinate.y >= origin.y &&
                   coordinate.y - origin.y < length
        }
    }
}

struct Board {
    
    var ships: [Ship] = []
    
    func fire(location: Coordinate) -> Bool {
        for ship in ships {
            if ship.isHit(coordinate: location) {
                print("Hit!")
                return true
            }
        }
        
        return false
    }
    
}

let patrolBoat = Ship(origin: Coordinate(x: 2, y: 2), direction: "Right", length: 2)
let battleship = Ship(origin: Coordinate(x: 5, y: 3), direction: "Down", length: 4)
let submarine = Ship(origin: Coordinate(x: 0, y: 0), direction: "Down", length: 3)

var board = Board()
board.ships.append(contentsOf: [patrolBoat, battleship, submarine])

board.fire(location: Coordinate(x: 2, y: 2)) 

board.fire(location: Coordinate(x: 2, y: 3))

board.fire(location: Coordinate(x: 5, y: 6))

board.fire(location: Coordinate(x: 5, y: 7))
