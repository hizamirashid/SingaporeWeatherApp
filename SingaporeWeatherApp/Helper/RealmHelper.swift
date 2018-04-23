//
//  RealmHelper.swift
//  SingaporeWeatherApp
//
//  Created by Mohammad Norhizami Bin Mohd Rashid on 24/04/2018.
//  Copyright © 2018 Mohammad Norhizami Bin Mohd Rashid. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    private init() {}
    static let shared = RealmHelper()
    
    var realm = try! Realm()
    
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            post(error)
        }
    }
    
    func post(_ error: Error) {
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    
    func observeRealmErrors(in vc: UIViewController, completion: @escaping( Error?) -> Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil) { (notification) in
            completion(notification.object as? Error)
            
        }
    }
    
    func stopObserveErrors(in vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
    }

}
