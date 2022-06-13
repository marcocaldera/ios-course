//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutelt allows me to reference a UI element
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //WHO           WHAT    VALUE
//        diceImageView1.image =  UIImage(named:"DiceThree")
//        diceImageView2.image =  UIImage(named:"DiceTwo")
//
//        //        diceImageView1.alpha = 0.5
//    }
//
    
    
    @IBAction func onRollButtonPressed(_ sender: UIButton) {
        
        let diceFaces = [
            UIImage(named:"DiceOne"),
            UIImage(named:"DiceTwo"),
            UIImage(named:"DiceThree"),
            UIImage(named:"DiceFour"),
            UIImage(named:"DiceFive"),
            UIImage(named:"DiceSix")
        ]
        
        diceImageView1.image = diceFaces[Int.random(in: 0...5)]
        diceImageView2.image = diceFaces[Int.random(in: 0...5)]
    }
    
}

