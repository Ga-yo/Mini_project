//
//  ViewController.swift
//  Map_view
//
//  Created by 이가영 on 2020/02/19.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var Mapview: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        Mapview.showsUserLocation = true
    }

    
    
    
}

