//
//  LocationManager.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/20/22.
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
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
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
    
    struct LocationView: View {
        @StateObject var locationManager = LocationManager()
        
        var body: some View {
            VStack {
                if let location = locationManager.location {
                    Text("Your location: \(location.latitude), \(location.longitude)")
                }
                
                LocationButton {
                    locationManager.requestLocation()
                }
                .frame(height: 44)
                .padding()
            }
        }
    }
    
    struct StopItemView_Previews: PreviewProvider {
        static var previews: some View {
            LocationView()
        }
    }

}


