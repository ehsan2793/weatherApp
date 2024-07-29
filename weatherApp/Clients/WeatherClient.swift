//
//  WeatherClient.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import Foundation

struct WeatherClient {
    func FeatchWeather(location: Location) async throws -> Weather {
    
        let (data, response) = try await URLSession.shared.data(from: ApiEndpoint.endPointURL(for: .weatherByLocation(location.coord.lat, location.coord.lon)))
        

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse }

        
        let WeatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return WeatherResponse.main
    }
}
