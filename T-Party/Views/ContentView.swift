//
//  ContentView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/10/22.
//
import SwiftUI
import CoreLocation




struct ContentView: View {
    
    @State var needToGetLoc = false
    @State var currStops = Stops()
    @StateObject var manager = LocationManager()
    
    var body: some View {
        TabView {
            ScheduleListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            NearbyView()
                .tabItem {
                    Label("Nearby", systemImage: "location")
            }
        } .task {
            try!await currStops.update()
            print("stop val:", currStops.stops[0].stopName)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

