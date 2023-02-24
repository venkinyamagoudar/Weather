//
//  TestViewController.swift
//  WeatherTests
//
//  Created by Venkatesh Nyamagoudar on 1/6/23.
//

import XCTest
@testable import Weather

final class TestViewController: XCTestCase {
    
    var viewController: ViewController!
    var viewModel: ViewControllerViewModel!
    var prediction: DailyPrediction!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        _ = viewController.view
        viewModel = ViewControllerViewModel()
        
        tableView = viewController.nextDayTableView
        tableView.delegate = viewController
        tableView.dataSource = viewController
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
    
    //MARK: Nil check
    func testVievController_TableViewShouldNotBeNil() {
        XCTAssertNotNil(viewController.nextDayTableView)
    }
    
    //MARK: TableView DataSource
    func testDataSource_ViewController_nextDayTableViewDataSource() {
        XCTAssertNotNil(viewController.nextDayTableView.dataSource)
        XCTAssertTrue(viewController.nextDayTableView.dataSource is ViewController)
    }
    
    // MARK: TableView Delegate
    func testDelegate_ViewController_nextDayTableViewDelegate() {
        XCTAssertNotNil(viewController.nextDayTableView.delegate)
        XCTAssertTrue(viewController.nextDayTableView.delegate is ViewController)
    }
    
    //MARK: Test TableView DataSource and Delegate are set to similar dataservice or not -> remember to cast thje data services used for delegate and datasource
    func test_ViewController_SingleObject() {
        XCTAssertEqual(viewController.nextDayTableView.dataSource as! ViewController, viewController.nextDayTableView.delegate as! ViewController)
    }
    
    //MARK: Test Number of sections in TableView
    func test_NumberOfSections_nextDayTableView() {
        XCTAssertEqual(viewController.nextDayTableView.numberOfSections , 1)
    }
    
    //MARK: Test Number of rows in TableView - need to do better here
    func test_numberOfRows_nextDayTableView() {
        XCTAssertEqual(viewController.nextDayTableView.numberOfRows(inSection: 0), 10)
    }
    
    // MARK: Cells
    
    func test_CellForRowAt_returnNextTableViewCell() {
        prediction = viewModel.extractData(from: "Prediction", dataType: DailyPrediction.self)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
       XCTAssertTrue(cell is NextDayTableViewCell)
    }
    
//    func test_TableView_DataAssigned() {
//        let mockTable = TableViewMock()
//        mockTable.dataSource = viewController
//        mockTable.register(NextDayTableViewCell.self, forCellReuseIdentifier: "futureWeatherCell")
//        prediction = viewModel.extractData(from: "Prediction", dataType: DailyPrediction.self)
//        viewController.dailyPrediction = prediction
//        mockTable.reloadData()
//
//        let cell = mockTable.cellForRow(at: IndexPath(row: 0, section: 0)) as? NextDayTableViewCell
//        let maxTemp = prediction?.forecast.forecastday[0].day.maxtempF
//        let minTemp = prediction?.forecast.forecastday[0].day.maxtempF
//        let  day = prediction?.forecast.forecastday[0].date
//        let cond = prediction?.current.condition.text
//        let image = viewModel.getForecastedImage(condition: cond)
//        XCTAssertEqual(cell?.maximumTemperature.text, String(maxTemp!))
//        XCTAssertEqual(cell?.minimumTemperature.text, String(minTemp!))
//        XCTAssertEqual(cell?.day.text, day)
//
//    }
    
}

extension TestViewController {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            self.cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockCell : NextDayTableViewCell {
        var dataAssigned = false
        override func configure(data: DailyPrediction?, index: Int) {
            if let maxTemp = data?.forecast.forecastday[index].day.maxtempF,
               let minTemp = data?.forecast.forecastday[index].day.maxtempF,
               let  day = data?.forecast.forecastday[index].date,
               let cond = data?.current.condition.text ,
               let image = viewModel.getForecastedImage(condition: cond) {
                self.maximumTemperature.text = String(maxTemp)
                self.minimumTemperature.text = String(minTemp)
                self.day.text = day
                self.predictedImage.image = image
            }
        }
    }
}


extension TestViewController {
    
    //MARK: RightBarButton
    
    func test_ViewController_hasRightBarButton() {
        XCTAssertNotNil(viewController.navigationItem.rightBarButtonItem)
    }
    
    func test_ViewController_rightBarButton_SimilarTarget() {
        if let rightBarButton = viewController.navigationItem.rightBarButtonItem {
            XCTAssertNotNil(rightBarButton.target)
            XCTAssert(rightBarButton.target === viewController)
        }
    }
    
    func test_ViewController_rightBarButton_Action() {
        if let rightBarButton = viewController.navigationItem.rightBarButtonItem {
            XCTAssertNotNil(rightBarButton.action)
            if let name = rightBarButton.action?.description {
                XCTAssertEqual(name, "rightBarButtonTapped")
            }
        }
    }
}

extension TestViewController {
    
    func test_AlertController_similarTitle() {
        
        viewController.setAlertController()
        if let name = viewController.alertController.title?.description {
            XCTAssertEqual("Select one of the city.", name)
        }
    }
    
    func test_AlertController_SameNumberofActions(){
        viewController.setAlertController()
        XCTAssertEqual(viewController.alertController.actions.count, 6)
    }
    
    func test_AlertController_SameActions(){
        viewController.setAlertController()
        let ac = viewController.alertController
        XCTAssertEqual(ac?.actions[0].title, "Paris")
        XCTAssertEqual(ac?.actions[1].title, "London")
        XCTAssertEqual(ac?.actions[2].title, "Chicago")
        XCTAssertEqual(ac?.actions[3].title, "Edison")
        XCTAssertEqual(ac?.actions[4].title, "Miami")
        XCTAssertEqual(ac?.actions[5].title, "Cancel")
    }
    
//    func test_AlertController_SimilarHandler(){
//
//    }
}


