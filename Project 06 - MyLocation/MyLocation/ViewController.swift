//
//  ViewController.swift
//  MyLocation
//
//  Created by TimberTang on 16/11/24.
//  Copyright © 2016年 TimberTang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var labMyCurrentLocation: UILabel!
    
    
    fileprivate var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// to find my location
    ///
    /// - parameter sender: sender
    @IBAction func findMyLocation(_ sender: UIButton) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

    }
}

extension ViewController : CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
         self.labMyCurrentLocation.text = "Error while updating location " + error.localizedDescription
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            guard  error == nil else {
                self.labMyCurrentLocation.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if let palces = placemarks {
                if palces.count > 0 {
                    let pm = palces[0]
                    self.displayLocationInfo(pm)
                }else {
                    self.labMyCurrentLocation.text = "Problem with the data received from geocoder"
                }
            }
        })
        
    }
    
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            if let local = locality, let post = postalCode, let adminArea = administrativeArea, let coun = country {
                self.labMyCurrentLocation.text = local +  post +  adminArea +  coun
            }
        }
    }
}


