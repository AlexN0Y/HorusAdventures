//
//  WeatherService.swift
//  HorusAdventures
//
//  Created by Alex Gav on 24.09.2024.
//

import Foundation
import CoreLocation

class WeatherService {
    
    static let shared = WeatherService()
    
    private let apiKey = "8ec9e732ed89827a684cd1140f32768e"
    
    func fetchWeather(for attraction: Attraction) async throws -> (String, String)? {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(attraction.coordinates.latitude)&lon=\(attraction.coordinates.longitude)&appid=\(apiKey)&exclude=current"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let weatherData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            if let main = weatherData?["main"] as? [String: Any],
               let temperature = main["temp"] as? Double,
               let weatherArray = weatherData?["weather"] as? [[String: Any]],
               let weather = weatherArray.first,
               let mainWeather = weather["main"] as? String,
               let description = weather["description"] as? String {
                let temperatureCelsius = temperature - 273.15
                return ("\(mainWeather), \(description)".lowercased(), "\(Int(temperatureCelsius))")
            } else {
                return nil
            }
        } catch {
            print("Error parsing weather data: \(error)")
            return nil
        }
    }
}
