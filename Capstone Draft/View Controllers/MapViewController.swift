//
//  mapViewController.swift
//  Capstone Draft
//
//  Created by Christopher Pung on 11/15/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // declares a property
    var coreLoc: CoreLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // make an instance
        coreLoc = CoreLocation.init()
        //assign self as its delegate
        coreLoc.delegate = self
        // call start on it
        coreLoc.start()
    }
}

// degree of longitude along the equator is exactly 60
// degree of latitude is approximately 69 miles

extension MapViewController: CoreLocationDelegate{
    func updateLocation(location: CLLocation) {
        print(location)
        let span = MKCoordinateSpan.init(latitudeDelta: (1.0/69.0), longitudeDelta: (1.0/60.0))
        let region = MKCoordinateRegion.init(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
}
