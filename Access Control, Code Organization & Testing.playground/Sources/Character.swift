import Foundation

public enum GameCharacterType {
    case elf
    case giant
    case wizard
}

public protocol GameCharacter: AnyObject {
    var name: String { get }
    var hitPoints: Int { get set }
    var damage: Int { get }
}

class Elf: GameCharacter {
    
    var name = "Elf"
    
    var hitPoints = 3
    
    var damage = 10
}

class Giant: GameCharacter {
    
    var name = "Giant"
    
    var hitPoints = 10
    
    var damage = 3
}

class Wizard: GameCharacter {
    
    var name = "Wizard"
    
    var hitPoints = 5
    
    var damage = 5
}

public struct GameCharacterFactory {
    static public func make(ofType: GameCharacterType) -> GameCharacter {
        switch ofType {
        case .elf:
            return Elf()
        case .giant:
            return Giant()
        case .wizard:
            return Wizard()
        }
    }
}

public func battle(_ character1: GameCharacter, vs character2: GameCharacter) {
    character2.hitPoints -= character1.damage
    
    if character2.hitPoints <= 0 {
        print("\(character2.name) defeated!")
        return
    }
    
    character1.hitPoints -= character2.damage
    
    if character1.hitPoints <= 0 {
        print("\(character1.name) defeated!")
    } else {
        print("Both players still active!")
    }
}
