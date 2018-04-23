//
//  WeatherHeaderTableView.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 24/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//

import Foundation
import UIKit

class WeatherHeaderTableView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
