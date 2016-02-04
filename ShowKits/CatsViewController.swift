//
//  CatsViewController.swift
//  ShowKits
//
//  Created by Михаил Зайцев on 04.02.16.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CatsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locatioManager = CLLocationManager()
    var apiClient = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        
        locatioManager.desiredAccuracy = kCLLocationAccuracyBest
        locatioManager.delegate = self
        locatioManager.requestWhenInUseAuthorization()
    }
    
    @IBAction func showMeTheCats(sender: AnyObject) {
        
        let radius1:Double = 5
        apiClient.find("cat",
            longitude: mapView.centerCoordinate.longitude,
            latitude: mapView.centerCoordinate.latitude,
            radius: radius1) { (success, failure) -> Void in
            
        } 
    }
}

extension CatsViewController : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case CLAuthorizationStatus.AuthorizedWhenInUse, CLAuthorizationStatus.AuthorizedAlways:
            self.mapView.showsUserLocation = true
        default:
            print("User denied location")
        }
    }
}
