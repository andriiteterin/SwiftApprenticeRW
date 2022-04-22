import UIKit

protocol Pet {
    func fed()
}

protocol CleaningPet {
    func cleaning()
}

protocol SwimmingPet: Pet, CleaningPet {
    func putInATank()
}

protocol CagedPet: Pet, CleaningPet {
    func caged()
}

protocol WalkingPet: Pet {
    func excercise()
}

class Dog: WalkingPet {
    func excercise() {
        print("gav gav")
    }
    
    func fed() {
        print("nyam nyam")
    }
}

class Cat: WalkingPet {
    func excercise() {
        print("myau myau")
    }
    
    func fed() {
        print("nyam nyam")
    }
}

class Fish: SwimmingPet {
    
    func putInATank() {
        print("put")
    }
    
    func fed() {
        print("nyam")
    }
    
    func cleaning() {
        print("clean")
    }
}

class Bird: CagedPet {
    func caged() {
        print("Caged")
    }
    
    func fed() {
        print("nyam")
    }
    
    func cleaning() {
        print("clean")
    }
}

let dog = Dog()
let cat = Cat()
let fish = Fish()
let bird = Bird()

let walkingDuties: [WalkingPet] = [dog]
let feedingDuties: [Pet] = [dog, cat, fish, bird]
let tankingDuties: [SwimmingPet] = [fish]
let cagingDuties: [CagedPet] = [bird]
let cleaningDuties: [CleaningPet] = [fish, bird]

