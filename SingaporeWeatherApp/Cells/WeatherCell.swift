//
//  WeatherCell.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 24/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//

import UIKit
import RealmSwift

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with weatherObject: ForecastRealm) {
        
        self.dateLbl.text = weatherObject.forecast_Date
        self.temperatureLbl.text = "\(weatherObject.forecast_Low) - \(weatherObject.forecast_High)"
        self.weatherLbl.text = weatherObject.forecast_Text
        
    }
}
