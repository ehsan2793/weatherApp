//
//  Location.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import Foundation

struct Location: Codable {
    let name: String
    let coord: Coord
}

struct Coord: Codable {
     let lon: Double
     let lat: Double
 }
