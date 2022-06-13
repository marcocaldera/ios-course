import UIKit

var greeting = "Hello, playground"


// Structures almost a class

//struct Town {
//    let name = "Angela"
//    var citizens = ["Angela", "Jack"]
//    var resources = ["Grain": 100, "Ore": 42, "Wool": 75]
//
//    func fortify() {
//        print("Defences increased!")
//    }
//}
//
//var myTown = Town()
//print(myTown.citizens)
//print(myTown.resources)
//
//myTown.citizens.append("Keanu")
//print(myTown.citizens.count)
//
//myTown.fortify()

struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    func fortify() {
        print("Defences increased!")
    }
}

var anotherTown = Town(name: "MarkLand", citizens: ["Mark"], resources: ["Oro": 200])
