import UIKit

class Logger {
    private init () {}
    
    static let sharedInstance = Logger()
    
    func log(_ text: String){
        print(text)
    }
}

//Logger.sharedInstance.log("text")

struct Stack<Element> {
    private var elements: [Element] = []
    
    var count: Int {
        elements.count
    }
    
    mutating func push (item: Element) {
        elements.append(item)
    }
    
    func peek() -> Element? {
        elements.last
    }
    
    mutating func pop() -> Element? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeLast()
        }
    }
}


let elf = GameCharacterFactory.make(ofType: .elf)
let giant = GameCharacterFactory.make(ofType: .giant)
let wizard = GameCharacterFactory.make(ofType: .wizard)

battle(elf, vs: giant) // Giant defeated!
battle(wizard, vs: giant) // Giant defeated!
battle(wizard, vs: elf) // Elf defeated!
