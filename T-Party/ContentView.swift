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
        Text("this is me, content view.")
            .onAppear() {
                Api().loadData { (trains) in
                    self.trains = trains
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


