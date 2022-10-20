//
//  ContentView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/10/22.
//
import SwiftUI

struct ContentView: View {
    @State var trains = [Train]()

    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: OptionsView()){
//                    Text("Go to options view.")
//                }
//                .navigationTitle("")
//                .navigationBarHidden(true)
//            }
//        }
//        .onAppear() {
//            Api().loadData { (trains) in
//                self.trains = trains
//            }
//        }
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


