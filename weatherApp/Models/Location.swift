//
//  Location.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}
