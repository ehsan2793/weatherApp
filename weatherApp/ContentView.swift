//
//  ContentView.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Get Coord") {
                Task {
                    let geocodingClient = GeocodingClient()
                    let weatherClient = WeatherClient()
                    let location = try! await geocodingClient.coordinateByCity(city: "Houston")
                
                    let weather = try! await weatherClient.FeatchWeather(location: location!)
                    print(weather)
                     
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
