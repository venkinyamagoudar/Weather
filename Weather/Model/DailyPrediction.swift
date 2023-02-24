//
//  MaximumTemperature.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 4/20/22.
//

import Foundation

import Foundation

// MARK: - DailyPrediction
struct DailyPrediction: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph, windKph: Double
    let windDegree: Double
    let windDir: String
    let humidity: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case humidity
    }
}


// MARK: - Condition1
struct Condition: Codable {
    let text: String
}


// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String
    let day: Day

    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let maxwindMph, maxwindKph: Double
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case condition
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let localtimeEpoch: Double
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
