//
//  StoptionDetailView.swift
//  T-Party
//
//  Created by Emily Mallaber on 2/19/23.
//

import SwiftUI

struct StoptionDetailView: View {
    
    var stop: Stop
    var color: Color
    
    init(stopSelected: Stop) {
        self.stop = stopSelected
        if stopSelected.routeType == "Bus" {
            self.color = Color("BusYellow")
        }
        else{
            self.color = Color("GLGreen")
        }
    }
    
    var body: some View {
        ZStack{
            VStack{
                Text(stop.stopName)
                    .font(.system(size:25))
                    .foregroundColor(self.color)
                    .fontWeight(.bold)
                Text("from <origin> to <destination>")
                  //  .font(.system(size:24))
                Text("Arriving to <current stop> in").italic()
                ScrollView{
                 //   let schedSize = schedule.sched.count
                 //   ForEach(0..<schedSize, id: \.self) { pos in
                  //      ScheduleItemView(info: schedule, position: pos)
                    }
                }
            }
        }
    }
    
    
