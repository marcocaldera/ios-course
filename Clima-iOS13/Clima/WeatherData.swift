//
//  WeatherData.swift
//  Clima
//
//  Created by Marco Caldera on 29/01/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main: Codable {
    let temp: Float
}

struct Weather: Codable {
    let id: Int
    let description: String
}
