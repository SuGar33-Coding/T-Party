//
//  MapView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/20/22.
//

import SwiftUI
import MapKit


struct MapView: View {
    @ObservedObject var usersLocation : LocationManager
    var latitude: Double
    var longitude: Double
    @State var region : MKCoordinateRegion
    
    init(manager : LocationManager) {
        self.usersLocation = manager
        let lat = manager.location?.latitude ?? 0
        self.latitude = lat
        let long = manager.location?.longitude ?? 0
        self.longitude = long
        let reg = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: lat , longitude: long),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        self._region = State<MKCoordinateRegion>(initialValue: reg)
    }
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, annotationItems: stoptions) { stoption in
                MapAnnotation(coordinate: stoption.coords) {
                    Circle()
                        .fill(Color("GLGreen"))
                        .onTapGesture {
                            print("Tapped on \(stoption.stopName)")
                        }
                }
            }
        }
    }
}
