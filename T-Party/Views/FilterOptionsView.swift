//
//  FilterOptionsView.swift
//  T-Party
//
//  Created by Emily Mallaber on 2/5/23.
//

import SwiftUI


//struct FilterOptionsView: View {
////    @Binding var showT: Bool
////    @Binding var showBus: Bool
////
//
//    init(showT: Bool, showBus: Bool) {
//
//        }
//
//    var body: some View {
//        VStack{
//            Text("Map Filters")
//            Toggle(isOn: $showT) {
//                Text("Display T Stops")
//            }
//            .toggleStyle(iOSCheckboxToggleStyle())
//
//            Toggle(isOn: $showBus) {
//                Text("Display Bus Stops")
//            }
//            .toggleStyle(iOSCheckboxToggleStyle())
//
//        }
//    }
//}
//
//struct iOSCheckboxToggleStyle: ToggleStyle {
//    func makeBody(configuration: Configuration) -> some View {
//
//        Button(action: {
//            configuration.isOn.toggle()
//
//        }, label: {
//            HStack {
//                // 3
//                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
//
//                configuration.label
//            }
//        })
//    }
//}
