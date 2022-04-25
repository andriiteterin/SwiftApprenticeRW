import UIKit
import Foundation

enum Item {
  case message(String)
  case numbers([Int])
  case mixed(String, [Int])
  case person(name: String)
}

let items: [Item] = [.message("Hi"),
                     .mixed("Things", [1,2]),
                     .person(name: "Kirk"),
                     .message("Bye")]

extension Item: Codable {}

let data = try JSONEncoder().encode(items)
print("\nEncoded Items:")
print(String(data: data, encoding: .utf8)!)

//struct Spaceship: Codable {
//    var name: String
//    var crew: [CrewMember]
//    
//    enum CodingKeys: String, CodingKey {
//        case name = "starship_name"
//        case crew
//    }
//}
//
//struct CrewMember: Codable {
//    var name: String
//    var race: String
//}
//
//extension Spaceship {
//
//    enum CrewKeys: String, CodingKey {
//        case captain
//        case officer
//    }
//}
//
//extension Spaceship {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        name = try values.decode(String.self, forKey: .name)
//        let crewValues = try decoder.container(keyedBy: CrewKeys.self)
//        let captain = try crewValues.decodeIfPresent(CrewMember.self, forKey: .captain)
//        let officer = try crewValues.decodeIfPresent(CrewMember.self, forKey: .officer)
//        crew = [captain, officer].compactMap { $0 }
//    }
//}
//
//let incoming = "{\"spaceship_name\": \"USS Enterprise\", \"captain\":{\"name\":\"Spock\", \"race\":\"Human\"}, \"officer\":{\"name\": \"Worf\", \"race\":\"Klingon\"}}"
//
//let newSpaceship = try JSONDecoder().decode(Spaceship.self, from: incoming.data(using: .utf8)!)
//
//print(newSpaceship)
//
//
//let klingonSpaceship = Spaceship(name: "IKS NEGH'VAR", crew: [])
//let klingonMessage = try PropertyListEncoder().encode(klingonSpaceship)
//
//let decodedSpaceship = try PropertyListDecoder().decode(Spaceship.self, from: klingonMessage)
//print(decodedSpaceship)

