//
//  LocationManager.swift
//  T-Party
//
//  Created by Emily Mallaber on 2/4/23.
//

import Foundation
import CoreLocation
import CoreLocationUI
import SwiftUI
import UIKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last?.coordinate
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager ) {
        switch manager.authorizationStatus{
        case .authorizedWhenInUse:
            print("inuse")
            break
        case .authorizedAlways:
            print("always")
            break
        case .restricted, .denied:
            print("restricted")
            break
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        }
    }
}
