//
//  Weather.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
