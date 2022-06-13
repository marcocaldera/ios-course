//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Marco Caldera on 26/01/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let question: String
    let answer: String
    
    // It's not mandatory to have a custom initializer
    init(q: String, a: String) {
        question = q
        answer = a
    }
    
}
