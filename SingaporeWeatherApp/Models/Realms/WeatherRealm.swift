//
//  WeatherRealm.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 24/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class WeatherRealm: Object {
    
    dynamic var city: String? = nil
    dynamic var country: String? = nil
    dynamic var condition_Date: String? = nil
    dynamic var condition_Temperature: String? = nil
    dynamic var condition_Text: String? = nil
    dynamic var forecast = List<ForecastRealm>()
    
    convenience init(city: String?, country: String?, condition_Date: String?, condition_Temperature: String?, condition_Text: String?, forecast: List<ForecastRealm>) {
        self.init()
        self.city = city
        self.country = country
        self.condition_Date = condition_Date
        self.condition_Temperature = condition_Temperature
        self.condition_Text = condition_Text
        self.forecast = forecast
    }
}

@objcMembers class ForecastRealm: Object {
    
    dynamic var forecast_Date: String? = nil
    dynamic var  forecast_Low: String? = nil
    dynamic var  forecast_High: String? = nil
    dynamic var forecast_Text: String? = nil
    
    convenience init(forecast_Date: String?, forecast_Low: String?, forecast_High: String?, forecast_Text: String?) {
        self.init()
        self.forecast_Date = forecast_Date
        self.forecast_Low = forecast_Low
        self.forecast_High = forecast_High
        self.forecast_Text = forecast_Text
    }
}
