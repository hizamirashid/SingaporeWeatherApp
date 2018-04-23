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
        guard let low = weatherObject.forecast_Low, let high = weatherObject.forecast_High else { return }
        self.temperatureLbl.text = "\(low) - \(high)"
        self.weatherLbl.text = weatherObject.forecast_Text
        
    }
}
