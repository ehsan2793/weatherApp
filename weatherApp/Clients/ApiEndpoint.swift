//
//  ApiEndPoint.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import Foundation

enum ApiEndpoint {
    static let baseUrl = "https://api.openweathermap.org"
    case coordinateByLocationName(String)
    case weatherByLocation(Double, Double)

    private var path: String {
        switch self {
        case let .coordinateByLocationName(city):
            return "/data/2.5/weather?q=\(city)&appid=\(Constants.Keys.weatherAPIKEY)"
        case let .weatherByLocation(lat, log):
            return "/data/2.5/weather?lat=\(lat)&lon=\(log)&appid=\(Constants.Keys.weatherAPIKEY)"
        }
    }

    static func endPointURL(for endpoint: ApiEndpoint) -> URL {
        let endPointPath = endpoint.path
        guard let url = URL(string: baseUrl + endPointPath) else {
            print("Something went wrong while making url")
            fatalError("Not URL Type: WRONG URL")
        }
        return url
    }
}
