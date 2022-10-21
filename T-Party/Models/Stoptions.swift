//
//  Stoptions.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/20/22.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

struct Stoption: Identifiable {
    let stopName: String
    let coords: CLLocationCoordinate2D
    let lines: [String]
    let id = UUID()
    
    func getColor() -> Color {
        var thisColor: Color
        switch lines[0] {
        case("GL"):
            thisColor = Color("GLGreen2")
        case("BL"):
            thisColor = Color("BLBlue2")
        case("RL"):
            thisColor = Color("RLRed2")
        case("OL"):
            thisColor = Color("OLOrange2")
        default:
            thisColor = Color("BusYellow2")
        }
        return thisColor
    }
}

let stoptions = [
    Stoption(stopName: "BU East", coords: CLLocationCoordinate2D(latitude: 42.349560, longitude: -71.103660), lines: ["GL"]),
    Stoption(stopName: "Blandford Street", coords: CLLocationCoordinate2D(latitude: 42.349210, longitude: -71.100610), lines: ["GL"]),
    Stoption(stopName: "Commonwealth Ave @ St Mary's St", coords: CLLocationCoordinate2D(latitude: 42.349910, longitude: -71.106570), lines: ["57"])
]



