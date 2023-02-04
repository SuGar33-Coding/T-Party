//
//  NearbyView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/19/22.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct NearbyView: View {
    
    @State var stationChosen = false
    @State var station = "none yet"
    @State var specList = tList
    
    @State private var userLoc = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.349190,
            longitude: -71.104040),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005,
            longitudeDelta: 0.005)
    )
    
    var body: some View {
        NavigationView {
            VStack {
                Label("You're here...", systemImage: "location")
                Map(coordinateRegion: $userLoc, annotationItems: stoptions) { stoption in
                    MapAnnotation(coordinate: stoption.coords) {
                        Circle()
                            .fill(stoption.getColor())
                            .onTapGesture {
                                stationChosen = true
                                station = stoption.stopName
                                specList = tList.filter { $0.currentStation == station }
                            }
                    }
                }
                ScrollView {
                    VStack(alignment: .leading, spacing: 40){
                        if stationChosen == false {
                            ForEach(tList, id: \.id) { option in
                                NavigationLink(
                                    destination: ScheduleDetailView(senderKey: option)
                                        .navigationTitle(option.currentStation)
                                ) {
                                    SingleListItemView(thisOne: option)
                                }
                            }
                        }else{
                            ForEach(specList, id: \.id) { option in
                                NavigationLink(
                                    destination: ScheduleDetailView(senderKey: option)
                                        .navigationTitle(option.currentStation)
                                ) {
                                    SingleListItemView(thisOne: option)
                                }
                            }
                        }
                        
                    }
                }.navigationTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}
struct NearbyView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyView()
    }
}
