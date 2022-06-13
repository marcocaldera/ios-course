
// seems interface
protocol CanFly {
    func fly()
}

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("Makes an egg")
        }
    }
    
//    func fly() {
//        print("I'm flying")
//    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("Eagle fly")
    }
    
    
    func soar() {
        print("Bho")
    }
}

class Penguin: Bird {
    func swim() {
        print("Swim")
    }
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()


let myPenguin = Penguin()
myPenguin.swim()
myPenguin.layEgg()
//myPenguin.fly() // but this is not true


