import CoreGraphics

protocol AdavancedLifeSupport {
    func performCPR()
}


class EmergencyCallHanlder {
    var delegate: AdavancedLifeSupport?
    
    func assessSituation() {
        print("Assess")
    }
    
    func mediacalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdavancedLifeSupport {
    
    init(handler: EmergencyCallHanlder) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Perform CPR")
    }
    
}

class Doctor: AdavancedLifeSupport {
    
    init(handler: EmergencyCallHanlder) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Perform doctor CPR")
    }
    
    func useSomething() {
        
    }
}

let emilio = EmergencyCallHanlder()
//let pete = Paramedic(handler: emilio)
let angela = Doctor(handler: emilio)

emilio.assessSituation()
emilio.mediacalEmergency()
