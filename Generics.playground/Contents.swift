import UIKit

class Cat {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Keeper<Animal> {
    var name: String
    
    private var animals: [Animal] = []
    
    init(name: String) {
      self.name = name
    }
    
    func lookAfter(_ animal: Animal) -> Void {
        animals.append(animal)
    }
    
    var count: Int {
        animals.count
    }
    
    func removeLast() -> Animal {
        animals.removeLast()
    }
    
    func animal(at index: Int) -> Animal {
        animals[index]
    }
}

