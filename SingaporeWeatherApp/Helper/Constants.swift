//
//  Constants.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 23/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//

import Foundation

struct Constants {
    
    static let baseThumbnailURL = "https://8coin-staging.s3.amazonaws.com/missions/2/thumbnail/big/"
    static let specialBaseImageUrl = "https://8coin-staging.s3.amazonaws.com/campaigns/2/photos/original/"
    //    static let baseURLSOAP = "http://58.26.53.51/MessageGateway.svc"
    static let baseURLSOAP = "http://58.26.53.51/GatewayService/MessageGateway.svc"
    
    struct hexColor {
        static let orange = "FCA902"
        static let blueButton = "2C68A1"
        static let darkgray = "686868"
        static let blueCell = "ABCCEF"
        static let darkOrange = "D89101"
    }
    
    struct Strings {
        
        /**
         * This struct stores string constants used within the app.
         * All strings that are shown to the user should be placed
         * in this struct.
         */
        
        struct Errors {
            static let standardTitle = "Oops"
            static let standardError = "Something went wrong. Please try again later"
            static let connectionError = "It seems that there are some problems with your internet connection. Please try again later."
            static let authenticationError = "You have been logged out. Please relogin again."
            
            static let loginEmpty = "Please enter your IC Number and password to continue."
            static let registrationEmpty = "Please ensure to fill up all fields to continue."
            static let forgotPasswordEmpty = "Please enter your email to proceed"
            static let invalidEmail = "Please enter a valid email address"
            static let passwordMismatch = "Please ensure your password and confirm password match"
            static let tncNotAccepted = "Please accept the terms & conditions to proceed"
        }
        
        struct General {
            static let emptyString = ""
            static let cancel = "Cancel"
        }
    }
    
    struct UserDefaults {
        
    }
}
