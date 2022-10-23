//
//  ContentView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/10/22.
//
import SwiftUI
import CoreLocation

struct ContentView: View {
    @State var trains = [Train]()

    var body: some View {
        TabView {
            OptionsView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            NearbyView()
                .tabItem {
                    Label("Nearby", systemImage: "location")
                }
        }
        .onAppear {
            Task.detached {
                let thing = try! ScheduleFetcher(stopName: "70150")
                try! await thing.update();
                print("Outer data: ==========")
                print(thing.scheduleData)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


