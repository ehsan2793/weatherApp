//
//  MeasurementFormatter+Extentions.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/29/24.
//

import Foundation

extension MeasurementFormatter {
    static func temperture(value: Double) -> String {
        let temp = Measurement(value: value, unit: UnitTemperature.kelvin)

        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numberFormatter

        return formatter.string(from: temp)
    }
}
