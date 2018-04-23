//
//  APIHelper.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 23/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//

import Foundation
import Alamofire

class APIHelper: NSObject, XMLParserDelegate {
    
    static let sharedInstance = APIHelper()
    let userdefaults = UserDefaults.standard
    
    // MARK:- API CALL
    
    func getWeather(viewController: UIViewController, completion: @escaping (_ handleError: Result<Any>, _ jsonValue: Data?, _ errorMessage: String?) -> ()) {
        
        let url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22singapore%2C%20sg%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
        print(url)
        
        Alamofire.request(url).validate(statusCode: 200..<300).responseJSON { (response) in
            
            if let json = response.data {
                switch response.result {
                case .success :
                    completion(response.result, json, nil)
                case .failure :
                    completion(response.result, nil, "Oops, something went wrong, please try again later.")
                } // end switch
                
            } // end if let json
        }
    }
}
