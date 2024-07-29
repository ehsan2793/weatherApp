//
//  GeocodingCilent.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct GeocodingClient {
    func coordinateByCity(city: String) async throws -> Location? {
        let (data, response) = try await URLSession.shared.data(from: ApiEndpoint.endPointURL(for: .coordinateByLocationName(city)))

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.invalidResponse }

        let location = try JSONDecoder().decode(Location.self, from: data)
        return location
    }
}
