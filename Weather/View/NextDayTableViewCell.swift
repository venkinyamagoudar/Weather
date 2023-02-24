//
//  NextDayTableViewCell.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 4/20/22.
//

import UIKit

class NextDayTableViewCell: UITableViewCell {

    @IBOutlet weak var maximumTemperature: UILabel!
    @IBOutlet weak var minimumTemperature: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var predictedImage: UIImageView!
    
    var viewModel = ViewControllerViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(data: DailyPrediction?, index: Int) {
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
