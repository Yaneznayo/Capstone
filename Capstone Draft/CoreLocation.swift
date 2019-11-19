//
//  CoreLocation.swift
//  Capstone Draft
//
//  Created by Christopher Pung on 11/15/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation
import CoreLocation



class CoreLocation : NSObject{
    var delegate : CoreLocationDelegate?
    let man : CLLocationManager
    
    //initialize Stuff
    override init() {
        man = CLLocationManager()
        super.init()
        man.delegate = self
    }
    
    // ask for user authorization
    func start() {
        man.requestWhenInUseAuthorization()
    }
}

extension CoreLocation : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        // ask for permission to get location data
        switch status {
        case .authorizedAlways:
            man.requestLocation()
        case .authorizedWhenInUse:
            man.requestLocation()
        default:
            // todo: tell user they could not get location
            print("could not get location")
        }
    }
    // guarantees getting location exists, then sends it to the mapView
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lock = locations.first {
            delegate?.updateLocation(location: lock)
        }
    }
    // handle error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

