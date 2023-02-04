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
    
    @StateObject var locationManager = LocationManager()
    
    @State var stationChosen = false
    @State var station = "none yet"
    @State var specList = tList
    var body: some View {
        NavigationView {
            VStack {
                Label("You're here...", systemImage: "location")
                MapView(manager: locationManager)
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
