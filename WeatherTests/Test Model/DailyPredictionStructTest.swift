//
//  DailyPredictionStructTest.swift
//  WeatherTests
//
//  Created by Venkatesh Nyamagoudar on 1/6/23.
//

import XCTest
@testable import Weather

final class DailyPredictionStructTest: XCTestCase {
    
    var location: Location?
    var condition1: Condition?
    var condition2: Condition?
    var day1: Day?
    var day2: Day?
    var forecast1: Forecastday?
    var forecast2: Forecastday?
    var forecastArray: Forecast?
    var current: Current?
    var dailyPrediction: DailyPrediction?
    
    
    override func setUp() {
        super.setUp()
        
        location = Location(name: "Bengaluru", region: "Karnataka", country: "India", lat: 89, lon: 90, localtimeEpoch: 567575, localtime: "01-11-2023")
        
        condition1 = Condition(text: "Rainy")
        day1 = Day(maxtempC: 101.7, maxtempF: 0.0, mintempC: 50, mintempF: 0.0, maxwindMph: 10, maxwindKph: 23.3, condition: condition1!)
        
        condition2 = Condition(text: "Hot")
        day2 = Day(maxtempC: 40, maxtempF: 110, mintempC: 8, mintempF: 44.0, maxwindMph: 5, maxwindKph: 12.4, condition: condition2!)
        
        forecast1 = Forecastday(date: "01-06-2023", day: day1!)
        forecast2 = Forecastday(date: "05-06-2023", day: day2!)
        
        forecastArray = Forecast(forecastday: [forecast1!, forecast2!])
        
        current = Current(lastUpdatedEpoch: 12, lastUpdated: "01-06-2023", tempC: 0, tempF: 35, isDay: 1, condition: condition1!, windMph: 9, windKph: 18, windDegree: 23.0, windDir: "N", humidity: 78.8)
        dailyPrediction = DailyPrediction(location: location!,
                                          current: current!,
                                          forecast: forecastArray!)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_Location() {
        
        XCTAssertNotNil(location)
        XCTAssertEqual(location?.name, "Bengaluru")
        XCTAssertEqual(location?.region, "Karnataka")
        XCTAssertEqual(location?.country, "India")
        XCTAssertEqual(location?.lat,  89)
        XCTAssertEqual(location?.lon, 90)
        XCTAssertEqual(location?.localtimeEpoch, 567575)
        XCTAssertEqual(location?.localtime, "01-11-2023")
    }
    
    func testInit_Condition() {
        XCTAssertNotNil(condition1)
        XCTAssertEqual(condition1?.text, "Rainy")
    }
    
    func testInit_Day() {
        XCTAssertNotNil(day1)
        XCTAssertNotNil(condition1)
        XCTAssertEqual(day1?.maxtempC,  101.7)
        XCTAssertEqual(day1?.maxtempF, 0.0)
        XCTAssertEqual(day1?.condition.text, condition1?.text)
        XCTAssertEqual(day1?.maxwindKph, 23.3)
        XCTAssertEqual(day1?.maxwindMph,  10)
        XCTAssertEqual(day1?.mintempC, 50)
        XCTAssertEqual(day1?.mintempF, 0.0)
        
    }
    
    func testInit_Forecastday() {
        
        XCTAssertNotNil(forecast1)
        XCTAssertNotNil(day1)
        XCTAssertNotNil(condition1)
        XCTAssertEqual(forecast1?.date, "01-06-2023")
    }
    
    func testInit_Forecast() {
        XCTAssertNotNil(forecastArray)
        XCTAssertEqual(forecastArray?.forecastday[0].date, "01-06-2023")
    }

    func testInit_Current() {
        XCTAssertNotNil(current)
        XCTAssertEqual(current?.condition.text, "Rainy")
        XCTAssertEqual(current?.humidity,78.8)
        XCTAssertEqual(current?.windDir, "N")
        XCTAssertEqual(current?.windDegree, 23.0)
        XCTAssertEqual(current?.windKph, 18)
        XCTAssertEqual(current?.windMph, 9)
        XCTAssertEqual(current?.isDay, 1)
        XCTAssertEqual(current?.tempF, 35)
        XCTAssertEqual(current?.tempC, 0)
        XCTAssertEqual(current?.lastUpdated, "01-06-2023")
        XCTAssertEqual(current?.lastUpdatedEpoch, 12)
    }
    
    func testInit_DailyPrediction() {
        XCTAssertNotNil(dailyPrediction)
    }

}
