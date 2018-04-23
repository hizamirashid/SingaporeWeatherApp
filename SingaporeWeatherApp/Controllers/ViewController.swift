//
//  ViewController.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 23/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    // IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var weathers: Results<WeatherRealm>!
    var forecasts: Results<ForecastRealm>!
    var weatherObject: Weather!
    var foreCastArray = List<ForecastRealm>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let realm = RealmHelper.shared.realm
        weathers = realm.objects(WeatherRealm.self)
        forecasts = realm.objects(ForecastRealm.self)
        
        // call the weather api
        
        if weathers.isEmpty {
            getWeathers()
        } else {
            self.updateUI()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
        let weather = weathers[0]
        
        guard let city = weather.city,
            let country = weather.country,
            let condition_Date = weather.condition_Date,
            let condition_Temperature = weather.condition_Temperature,
            let condition_Text = weather.condition_Text else { return }
        // set navigation title
        self.title = "\(city), \(country)"
        
        let view = (Bundle.main.loadNibNamed("WeatherHeaderTableView", owner: self, options: nil)![0] as? WeatherHeaderTableView)
        view?.dateLbl.text = condition_Date
        view?.temperatureLbl.text = condition_Temperature
        view?.weatherLbl.text = condition_Text
        self.tableView.tableHeaderView = view
        
        self.tableView.reloadData()
    }
    
    // MARK:- API CALL
    
    func getWeathers() {
        MDSUtilities.sharedInstance.showLoadingActivity(self)
        APIHelper.sharedInstance.getWeather(viewController: self) { (result, jsonResult, errorMessage) -> Void in
            
            switch result {
            case .success:
                MDSUtilities.sharedInstance.hideLoadingActivity(self)
                guard let data = jsonResult else { return }
                do {
                    self.weatherObject = try JSONDecoder().decode(Weather.self, from: data)
                    
                    guard let city = self.weatherObject.query?.results?.channel?.location?.city,
                        let country = self.weatherObject.query?.results?.channel?.location?.country,
                        let condition_Date = self.weatherObject.query?.results?.channel?.item?.condition?.date,
                        let condition_Temperature = self.weatherObject.query?.results?.channel?.item?.condition?.temp,
                        let condition_Text = self.weatherObject.query?.results?.channel?.item?.condition?.text,
                        let forecast = self.weatherObject.query?.results?.channel?.item?.forecast else { return }
                        
                    
                    for item in forecast {
                        let newItem = ForecastRealm(forecast_Date: item.date, forecast_Low: item.low, forecast_High: item.high, forecast_Text: item.text)
                        self.foreCastArray.append(newItem)
                    }
                    
                    let newWeatherRealm = WeatherRealm(city: city, country: country, condition_Date: condition_Date, condition_Temperature: condition_Temperature, condition_Text: condition_Text, forecast:self.foreCastArray)
                    RealmHelper.shared.create(newWeatherRealm)
                    
                    // update interface
                    self.updateUI()
                    
                } catch {
                    print(error)
                }
                
            case .failure:
                MDSUtilities.sharedInstance.hideLoadingActivity(self)
                MDSUtilities.showGenericAlertWithTitle(self, title: "", message: Constants.Strings.Errors.connectionError)
            }
            
        } // APIHelper end
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCell else { return UITableViewCell() }
        
        let forecast = forecasts[indexPath.row]
        cell.configure(with: forecast)
        
        return cell
    }
    
}

