//
//  TestViewControllerViewModel.swift
//  WeatherTests
//
//  Created by Venkatesh Nyamagoudar on 1/6/23.
//

import XCTest
@testable import Weather

final class TestViewControllerViewModel: XCTestCase {
    
    let obj = ViewControllerViewModel()
    
    override class func setUp() {
        super.setUp()
        
    }

    override class func tearDown() {
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Initial Values
    func testInit_ViewControllerViewModel_dailyPrediction_isNil() {
        XCTAssertNil(obj.dailyPrediction)
    }
    
    //MARK: Functions
    
    func test_setURL_ReturnString() {
        let city = "Edison"
        let url = obj.setURL(city: city)
        XCTAssertNotNil(url)
        XCTAssertEqual(url, "https://api.weatherapi.com/v1/forecast.json?key={3bd11cf496d54126b8215228230401}&q=Edison&days=10&aqi=no&alerts=no")
    }
    
    func test_extractDatafromJsonFile_InvalidFileName() {
        let filename = "nil"
        let data = obj.extractData(from: filename , dataType: DailyPrediction.self)
        XCTAssertNil(data)
    }
    
    func test_extractDatafromJsonFile_InvalidDataType() {
        let filename = "Prediction"
        let data = obj.extractData(from: filename , dataType: Condition.self)
        XCTAssertNil(data)
    }
    
    func test_extractDatafromJsonFile_ValidOutput() {
        let filename = "Prediction"
        let data = obj.extractData(from : filename, dataType: DailyPrediction.self)
        XCTAssertNotNil(data)
    }
    
    func test_extractJsonData_Success() {
        let url = obj.setURL(city: "London")
        obj.extractJsonData(from: url) { result in
            switch result {
            case .success(let success):
                XCTAssertNotNil(success)
            case .failure(let failure):
                XCTAssertNil(failure)
            }
        }
    }
    
    func test_parseJsonData_Success() {
        let url = obj.setURL(city: "London")
        obj.extractJsonData(from: url) { result in
            switch result {
            case .success(let data):
                self.obj.parseJsonData(jsonData: data) { reslut in
                    switch reslut {
                    case .success(let success):
                        XCTAssertNotNil(success)
                    case .failure(let failure):
                        XCTAssertNil(failure)
                    }
                }
            case .failure(let failure):
                XCTAssertNil(failure)
            }
        }
    }
    
    func test_getForecastedImage_ReturnImageOvercast() {
        let imagName : String = "Overcast"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageClear() {
        let imagName : String = "Clear"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageFine() {
        let imagName : String = "Fine"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageFair() {
        let imagName : String = "Fair"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageBright() {
        let imagName : String = "Bright"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSunny() {
        let imagName : String = "Sunny"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageCloudy() {
        let imagName : String = "Cloudy"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageMostlyCloudy() {
        let imagName : String = "Mostly Cloudy"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageClearLightdrizzle() {
        let imagName : String = "Light drizzle"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageLightrain() {
        let imagName : String = "Light rain"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageLightrainshower() {
        let imagName : String = "Light rain shower"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageMist() {
        let imagName : String = "Mist"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageModeraterain() {
        let imagName : String = "Moderate rain"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImagePartlycloudy() {
        let imagName : String = "Partly cloudy"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSunnyPeriods() {
        let imagName : String = "Sunny Periods"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImagePartlyBright() {
        let imagName : String = "Partly Bright"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageMild() {
        let imagName : String = "Mild"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImagePatchylightdrizzle() {
        let imagName : String = "Patchy light drizzle"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImagePatchylightrain() {
        let imagName : String = "Patchy light rain"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageFog() {
        let imagName : String = "Fog"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImagePatchyrainpossible() {
        let imagName : String = "Patchy rain possible"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageBlowingSnow() {
        let imagName : String = "Blowing Snow"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageBlizzard() {
        let imagName : String = "Blizzard"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    
    func test_getForecastedImage_ReturnImageSnowdrift() {
        let imagName : String = "Snowdrift"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSnowstorm() {
        let imagName : String = "Snowstorm"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageCold() {
        let imagName : String = "Cold"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageChilly() {
        let imagName : String = "Chilly"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageFreezing() {
        let imagName : String = "Freezing"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageFrost() {
        let imagName : String = "Frost"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageCool() {
        let imagName : String = "Cool"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageFreezingRain() {
        let imagName : String = "Freezing Rain"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImage() {
        let imagName : String = "Clear"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageHail() {
        let imagName : String = "Hail"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageHot() {
        let imagName : String = "Hot"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageIsolatedShower() {
        let imagName : String = "Isolated Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageLightShower() {
        let imagName : String = "Light Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageLightSnow() {
        let imagName : String = "Light Snow"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageOccasionalShowers() {
        let imagName : String = "Occasional Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageScatteredShowers() {
        let imagName : String = "Scattered Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageRainy() {
        let imagName : String = "Rainy"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSandstorm() {
        let imagName : String = "Sandstorm"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageDuststorm() {
        let imagName : String = "Duststorm"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSand() {
        let imagName : String = "Sand"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageDust() {
        let imagName : String = "Dust"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageShowers() {
        let imagName : String = "Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageHeavyShowers() {
        let imagName : String = "Heavy Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageRainShowers() {
        let imagName : String = "Rain Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSleet() {
        let imagName : String = "Sleet"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSnowShowers() {
        let imagName : String = "Snow Showers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageFlurries() {
        let imagName : String = "Flurries"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSnow() {
        let imagName : String = "Snow"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageHeavySnow() {
        let imagName : String = "Heavy Snow"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    
    func test_getForecastedImage_ReturnImageSnowfall() {
        let imagName : String = "Snowfall"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageThunderRain() {
        let imagName : String = "Thunder Rain"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageThunderstorms() {
        let imagName : String = "Thunderstorms"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageThundershowers() {
        let imagName : String = "Thundershowers"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageStormLightning() {
        let imagName : String = "Lightning"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageWarm() {
        let imagName : String = "Warm"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageWindy() {
        let imagName : String = "Windy"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageSquall() {
        let imagName : String = "Squall"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageStorm() {
        let imagName : String = "Storm"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImageGale() {
        let imagName : String = "Gale"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
    
    func test_getForecastedImage_ReturnImagedefault() {
        let imagName : String = "mostly sunny"
        let name = obj.getForecastedImage(condition: imagName)
        XCTAssertNotNil(name)
    }
}
