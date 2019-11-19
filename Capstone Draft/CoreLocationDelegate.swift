//
//  CoreLocationDelegate.swift
//  Capstone Draft
//
//  Created by Christopher Pung on 11/15/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation
import CoreLocation

protocol CoreLocationDelegate{
   // func intFunc(int:Int) -> Int
    func updateLocation(location: CLLocation)
}
