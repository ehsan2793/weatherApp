//
//  ContentView.swift
//  weatherApp
//
//  Created by Ehsan Rahimi on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    @State private var weather: Weather?
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
 

    private func featchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city: city) else { return }
            weather = try await weatherClient.FeatchWeather(location: location)
        } catch {
            print(error)
        }
    }

    var body: some View {
        ZStack {
            Color.blue.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                TextField("City", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        isFetchingWeather = true
                    }.task(id: isFetchingWeather) {
                        if isFetchingWeather {
                            await featchWeather()
                            isFetchingWeather = false
                            city = ""
                        }
                    }
                Spacer()
                if let weather {
                    Text(MeasurementFormatter.temperture(value: weather.temp))
                        .font(.system(size: 100))
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
