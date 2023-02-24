//
//  ViewControllerViewModel.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 1/5/23.
//

import Foundation
import UIKit


class ViewControllerViewModel {
    
    var city = "Piscataway"
    var dailyPrediction: DailyPrediction?
    
    /// Description: Used to get the URL
    /// - Parameter city: the city name from which weather is diplayed
    /// - Returns: URL in the String type, Write the generated Key in the URL instead of KEY
    func setURL(city: String) -> String {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=KEY&q=\(city)&days=10&aqi=no&alerts=no"
        return url
    }
    
    /// Description:  Function used to extract data from from JSON file.
    /// - Parameters:
    ///   - fileName: name of the file used to extract data
    ///   - dataType: the datatype which is used for decoding
    /// - Returns: The decoded data from file
    func extractData<T: Decodable>(from fileName: String, dataType: T.Type) -> T? {
        var jsonData: Data!
        do{
            if let path = Bundle.main.path(forResource: fileName, ofType: "json"){
                let fileURL = URL(fileURLWithPath: path)
                jsonData = try Data(contentsOf: fileURL)
            } else {
                print("File not found")
                return nil
            }
        } catch {
            print("error while parsing\(error)")
        }
        let decoder = JSONDecoder()
        var parsedData : T!
        do {
            parsedData = try? decoder.decode(T.self, from: jsonData!)
            return parsedData
        }
        catch {
            print("error while parsing \(error)")
            return nil
        }
        
    }
    
    /// Description: Function used to get the data according to the DailyPredictoion Model.
    /// - Parameters:
    ///   - jsonData: The jsondata that is extracted from the URL
    ///   - completion: completion handler that handels the operation is success or failure
    func parseJsonData(jsonData: Data, completion: @escaping(Result<DailyPrediction,Error>) -> Void) {
        do{
            let decodedData = try JSONDecoder().decode(DailyPrediction.self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    /// Description: Function used to extract data from from URL
    /// - Parameters:
    ///   - urlString: Desired URl in string format
    ///   - completion: Completion handler that handels the operation is success or failure
    func extractJsonData(from urlString: String, completion: @escaping(Result<Data,Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
    
    
    /// Description:images are from this website https://worldweather.wmo.int/en/wxicons.html
    /// - Parameter condition: Condition that is predicted for the day
    /// - Returns: UIImage that is related to the condition
    func getForecastedImage(condition: String?) -> UIImage? {
        var image: UIImage?
        
        guard let condition = condition else {
            return nil
        }
        
        switch condition {
        case "Clear" :
            image = UIImage(named: "Daytime_Bright_Sunny_Fair_Fine_Clear")
        case "Fine" :
            image = UIImage(named: "Daytime_Bright_Sunny_Fair_Fine_Clear")
        case "Fair" :
            image = UIImage(named: "Daytime_Bright_Sunny_Fair_Fine_Clear")
        case "Bright" :
            image = UIImage(named: "Daytime_Bright_Sunny_Fair_Fine_Clear")
        case "Sunny":
            image = UIImage(named: "sunny")
        case "Cloudy":
            image = UIImage(named: "Cloudy")
        case "Mostly Cloudy":
            image = UIImage(named: "Cloudy")
        case "Light drizzle":
            image = UIImage(named: "Light Showers")
        case "Light rain":
            image = UIImage(named: "Light Showers")
        case "Light rain shower":
            image = UIImage(named: "Light Showers")
        case "Mist":
            image = UIImage(named: "Mist")
        case "Moderate rain":
            image = UIImage(named: "Rain")
        case "Overcast":
            image = UIImage(named: "Overcast")
        case "Partly cloudy":
            image = UIImage(named: "Partly cloudy")
        case "Sunny Periods":
            image = UIImage(named: "Partly cloudy")
        case "Partly Bright":
            image = UIImage(named: "Partly cloudy")
        case "Mild":
            image = UIImage(named: "Partly cloudy")
        case "Patchy light drizzle":
            image = UIImage(named: "Occasional Showers_Scattered Showers")
        case "Patchy light rain":
            image = UIImage(named: "Occasional Showers_Scattered Showers")
        case "Patchy rain possible":
            image = UIImage(named: "Occasional Showers_Scattered Showers")
            
        case "Fog":
            image = UIImage(named: "Fog")
        case "Blowing Snow":
            image = UIImage(named: "Blowing Snow_Blizzard_Snowdrift_Snowstorm")
        case "Blizzard":
            image = UIImage(named: "Blowing Snow_Blizzard_Snowdrift_Snowstorm")
        case "Snowdrift":
            image = UIImage(named: "Blowing Snow_Blizzard_Snowdrift_Snowstorm")
        case "Snowstorm":
            image = UIImage(named: "Blowing Snow_Blizzard_Snowdrift_Snowstorm")
        case "Cold":
            image = UIImage(named: "Cold_Chilly_Freezing_Frost")
        case "Chilly":
            image = UIImage(named: "Cold_Chilly_Freezing_Frost")
        case "Freezing":
            image = UIImage(named: "Cold_Chilly_Freezing_Frost")
        case "Frost":
            image = UIImage(named: "Cold_Chilly_Freezing_Frost")
        case "Cool":
            image = UIImage(named: "Cool")
        case "Freezing Rain":
            image = UIImage(named: "Freezing Rain")
        case "Hail":
            image = UIImage(named: "Hail")
        case "Hot":
            image = UIImage(named: "Hot")
        case "Isolated Showers":
            image = UIImage(named: "Isolated Showers")
        case "Light Showers":
            image = UIImage(named: "Light Showers")
        case "Light Snow":
            image = UIImage(named: "Light Snow")
        case "Occasional Showers":
            image = UIImage(named: "Occasional Showers_Scattered Showers")
        case "Scattered Showers":
            image = UIImage(named: "Occasional Showers_Scattered Showers")
        case "Rainy":
            image = UIImage(named: "Rain")
        case "Sandstorm":
            image = UIImage(named: "Sandsorm_Duststorm_Sand_Dust")
        case "Duststorm":
            image = UIImage(named: "Sandsorm_Duststorm_Sand_Dust")
        case "Sand":
            image = UIImage(named: "Sandsorm_Duststorm_Sand_Dust")
        case "Dust":
            image = UIImage(named: "Sandsorm_Duststorm_Sand_Dust")
        case "Showers":
            image = UIImage(named: "Showers_Heavy Showers_Rainshower")
        case "Heavy Showers":
            image = UIImage(named: "Showers_Heavy Showers_Rainshower")
        case "Rain Showers":
            image = UIImage(named: "Showers_Heavy Showers_Rainshower")
        case "Sleet":
            image = UIImage(named: "Sleet")
        case "Snow Showers":
            image = UIImage(named: "Snow Showers_Flurries")
        case "Flurries":
            image = UIImage(named: "Snow Showers_Flurries")
        case "Snow":
            image = UIImage(named: "Snow_Heavy Snow_Snowfall")
        case "Heavy Snow":
            image = UIImage(named: "Snow_Heavy Snow_Snowfall")
        case "Snowfall":
            image = UIImage(named: "Snow_Heavy Snow_Snowfall")
        case "Thunder Rain":
            image = UIImage(named: "Thunder rain")
        case "Thunderstorms":
            image = UIImage(named: "Thunderstorms_Thundershowers_Storm_Lightning")
        case "Thundershowers":
            image = UIImage(named: "Thunderstorms_Thundershowers_Storm_Lightning")
        case "Storm":
            image = UIImage(named: "Thunderstorms_Thundershowers_Storm_Lightning")
        case "Lightning":
            image = UIImage(named: "Thunderstorms_Thundershowers_Storm_Lightning")
        case "Warm":
            image = UIImage(named: "Warm")
        case "Windy":
            image = UIImage(named: "Windy_Squall_Stormy_Gale")
        case "Squall":
            image = UIImage(named: "Windy_Squall_Stormy_Gale")
        case "Stormy":
            image = UIImage(named: "Windy_Squall_Stormy_Gale")
        case "Gale":
            image = UIImage(named: "Windy_Squall_Stormy_Gale")
        default:
            image = UIImage(named: "sunny")
        }
        return image
    }
}
