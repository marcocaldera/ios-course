//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    let softTime = 5
    //    let mediumTime = 7
    //    let hardTime = 12
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 420, "Hard": 720]
    var remainingSeconds = 0
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        let result = eggTimes[hardness]!
        
        remainingSeconds = result
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if remainingSeconds > 0 {
                print ("\(remainingSeconds) seconds")
                remainingSeconds -= 1
                progressBar.progress = Float(remainingSeconds) / Float(result)
            } else {
                timer.invalidate()
                titleText.text = "DONE"
            }
        }
        
        //        if hardness == "Soft" {
        //            print(softTime)
        //        } else if hardness == "Medium" {
        //            print(mediumTime)
        //        } else {
        //            print(hardTime)
        //        }
    }
    
}
