//
//  MDSUtilities.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 23/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//


import UIKit
import AVFoundation
import NVActivityIndicatorView

class MDSUtilities {
    
    static let sharedInstance = MDSUtilities()
    
    // NVActivityIndicator
    var activityIndicator: NVActivityIndicatorView?
    func showLoadingActivity(_ viewController: UIViewController) {
        if activityIndicator == nil {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            activityIndicator = NVActivityIndicatorView(frame: CGRect(x:(appDelegate.window?.bounds.width)!/2-50, y:(appDelegate.window?.bounds.height)!/2-50, width:100, height:100), type: NVActivityIndicatorType.circleStrokeSpin, color: UIColor.orange, padding: 30.0)
            activityIndicator?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            activityIndicator?.layer.cornerRadius = 10
            
            if let window = appDelegate.window {
                window.addSubview(activityIndicator!)
            } else { viewController.view.addSubview(activityIndicator!) }
            viewController.view.window?.isUserInteractionEnabled = false
            activityIndicator?.startAnimating()
        }
    }
    
    func hideLoadingActivity(_ viewController: UIViewController) {
        if activityIndicator != nil {
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
            activityIndicator = nil
            viewController.view.window?.isUserInteractionEnabled = true
        }
    }
    
    class func showGenericAlertWithTitle(_ viewController: UIViewController?, title: String, message: String?) {
        
        if let viewController = viewController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            
            alert.addAction(okAction)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    class func showGenericAlertWithTitleAndPositiveButton(_ viewController: UIViewController?, title: String, message: String?, positiveButtonTitle: String, positiveButtonHandler: ((UIAlertAction) -> Void)?) {
        
        if let viewController = viewController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let positiveAction = UIAlertAction(title: positiveButtonTitle, style: .default, handler: positiveButtonHandler)
            
            alert.addAction(positiveAction)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    class func showGenericAlertWithTitleAndPositiveAndNegativeButton(_ viewController: UIViewController?, title: String, message: String?, positiveButtonTitle: String, positiveButtonHandler: ((UIAlertAction) -> Void)?, negativeButtonTitle: String, negativeButtonHandler: ((UIAlertAction) -> Void)?) {
        
        if let viewController = viewController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let positiveAction = UIAlertAction(title: positiveButtonTitle, style: .default, handler: positiveButtonHandler)
            let negativeAction = UIAlertAction(title: negativeButtonTitle, style: .cancel, handler: negativeButtonHandler)
            
            alert.addAction(positiveAction)
            alert.addAction(negativeAction)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
