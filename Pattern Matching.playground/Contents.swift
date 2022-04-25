import UIKit
import CoreFoundation

enum FormField {
    case firstName(String)
    case lastName(String)
    case emailAddress(String)
    case age(Int)
}

let minimumAge = 21
let submittedAge = FormField.age(22)

if case .age(let years) = submittedAge, years > minimumAge  {
    print("Welcome!")
} else {
    print("You are too young")
}

enum CelestialBody {
    case star
    case planet(liquidWater: Bool)
    case comet
}

let telescopeCensus = [
    CelestialBody.star,
    .planet(liquidWater: false),
    .planet(liquidWater: true),
    .planet(liquidWater: true),
    .comet
]

for water in telescopeCensus {
    switch water {
    case .planet(let isWater) where isWater :
        print("Water is here")
    default:
        "Sorry, here is no water"
    }
}

let queenAlbums = [
    ("A Night at the Opera", 1974),
    ("Sheer Heart Attack", 1974),
    ("Jazz", 1978),
    ("The Game", 1980)
]

for (name, year) in queenAlbums {
    if year == 1974 {
        print("\(name) released in 1974")
    }
}

let coordinates = (lat: 37.334890, long: -122.009000)

switch coordinates {
case (let lat, _) where lat < 0:
    print("In the Southern hemisphere!")
case (let lat, _) where lat == 0:
    print("Its on the equator!")
case (let lat, _) where lat > 0:
    print("In the Northern hemisphere!")
default:
    break
}
