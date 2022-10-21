//
//  MapView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/20/22.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    @State private var userLoc = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.349190,
            longitude: -71.104040),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005,
            longitudeDelta: 0.005)
    )
    
    var body: some View {
        Map(coordinateRegion: $userLoc, annotationItems: stoptions) { stoption in
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


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
