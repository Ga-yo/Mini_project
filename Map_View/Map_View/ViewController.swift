//
//  ViewController.swift
//  Map_View
//
//  Created by 이가영 on 2020/02/19.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBAction func ChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.location1.text = "우리 집"
            self.location2.text = ""
            locationManager.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.511396, longitudeValue: 127.059443, delta: 0.1, strTitle: "SM TOWN", strSubTitle: "서울 삼성동 코엑스")
            location1.text = "보고 계신 위치"
            location2.text = "서울 삼성동 코엑스"
        }else {
            setAnnotation(latitudeValue: 36.391386, longitudeValue: 127.363265, delta: 0.1, strTitle: "MY SCHOOL", strSubTitle: "대전 유성구 장동 가정북로")
            location1.text = "보고 계신 위치"
            location2.text = "대전 유성구 장동 가정북로"
        }
    }
    func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        Map.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, strTitle: String, strSubTitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        Map.addAnnotation(annotation)
    }
    @IBOutlet weak var location1: UILabel!
    @IBOutlet weak var location2: UILabel!
    @IBOutlet weak var Map: MKMapView!
    
    var locationManager: CLLocationManager! = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        Map.showsUserLocation = true
        
        location1.text = ""
        location2.text = ""
    }


}

