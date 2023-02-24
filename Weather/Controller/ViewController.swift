//
//  ViewController.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextDayTableView: UITableView!
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var temperatiure: UILabel!
    
    var viewModel = ViewControllerViewModel()
    
    var dailyPrediction: DailyPrediction?
    var rightBarButton: UIBarButtonItem!
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        loadData(city: viewModel.city)
        
        self.nextDayTableView.delegate = self
        self.nextDayTableView.dataSource = self
        self.nextDayTableView.backgroundColor = .secondarySystemBackground
        
        rightBarButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                         style: .done,
                                         target: self,
                                         action: #selector(rightBarButtonTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func loadData(city: String) {
        let url = viewModel.setURL(city: city)
        self.viewModel.extractJsonData(from: url) { result in
            switch result {
            case .success(let data):
                self.viewModel.parseJsonData(jsonData: data) {[self] result in
                    switch result {
                    case .success(let data):
                        self.dailyPrediction = data
                        updateUI()
                    case .failure(let error):
                        print("\(error)")
                    }
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    @objc func rightBarButtonTapped() {
        setAlertController()
    }
    
    func setAlertController() {
        alertController = UIAlertController(title: "Select one of the city.",
                                            message: "",
                                            preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Paris", style: .default,handler: { [self] _ in
            self.viewModel.city = "Paris"
            self.loadData(city: self.viewModel.city)
        }))
        alertController.addAction(UIAlertAction(title: "London", style: .default,handler: { [self] _ in
            self.viewModel.city = "London"
            self.loadData(city: self.viewModel.city)
        }))
        alertController.addAction(UIAlertAction(title: "Chicago", style: .default, handler: { [self] _ in
            self.viewModel.city = "Chicago"
            self.loadData(city: self.viewModel.city)
        }))
        alertController.addAction(UIAlertAction(title: "Edison", style: .default, handler: { [self] _ in
            self.viewModel.city = "Edison"
            self.loadData(city: self.viewModel.city)
        }))
        alertController.addAction(UIAlertAction(title: "Miami", style: .default, handler: { [self] _ in
            self.viewModel.city = "Miami"
            self.loadData(city: self.viewModel.city)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true)
    }
    
    private func updateUI() {
        if let temp = dailyPrediction?.current.tempF,
           let loc = dailyPrediction?.location.name,
           let wSpeed = dailyPrediction?.current.windMph,
           let wDir = dailyPrediction?.current.windDir,
           let hum = dailyPrediction?.current.humidity,
           let cond = dailyPrediction?.current.condition.text {
            DispatchQueue.main.async { [self] in
                temperatiure.text = String(temp)
                location.text = String(loc)
                wind.text = String("\(wSpeed) mph")
                windDirection.text = String("Direction: \(wDir)")
                humidity.text = String("Humidity: \(hum)")
                condition.text = String(cond)
                
                nextDayTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = (self.dailyPrediction?.forecast.forecastday.count) ?? 10
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nextDayTableView.dequeueReusableCell(withIdentifier: "futureWeatherCell", for: indexPath) as! NextDayTableViewCell
        
        cell.configure(data: dailyPrediction, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

