import UIKit

class User {
    var lists: [String: List] = [:]
    
    func addList(_ list: List) {
        lists[list.name] = list
    }
    
    func list(forName name: String) -> List? {
        lists[name]
    }
}

class List {
    let name: String
    var movies: [String] = []
    
    func pirnt() {
        Swift.print("Movie List: \(name)")
        for movie in movies {
            Swift.print(movie)
        }
        Swift.print("\n")
    }
    
    init(name: String) {
        self.name = name
    }
}

let jane = User()
let john = User()
var actionList = List(name: "Action")

jane.addList(actionList)
john.addList(actionList)

jane.lists["Action"]?.movies.append("Rambo")
jane.lists["Action"]?.movies.append("Terminator")

john.lists["Action"]?.movies.append("Die Hard")

john.lists["Action"]?.pirnt()
