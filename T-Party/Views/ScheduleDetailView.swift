//
//  ScheduleView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/13/22.
//

import SwiftUI

struct ScheduleDetailView: View {
    
    var schedule: ListData
    
    init(schedule: ListData) {
        self.schedule = schedule
    }
    
    var body: some View {
        ZStack{
            VStack{
                Text(schedule.fullName)
                    .font(.system(size:50))
                    .foregroundColor(self.schedule.color2)
                    .fontWeight(.bold)
                Text(schedule.direction + " to " + schedule.destination)
                    .font(.system(size:24))
                Text("Arriving to " + schedule.currentStation + " in").italic()
                ScrollView{
                    let schedSize = schedule.sched.count
                    ForEach(0..<schedSize, id: \.self) { pos in
                        ScheduleItemView(info: schedule, position: pos)
                    }
                }
            }
        }
    }
    
    
    struct ScheduleDetailView_Previews: PreviewProvider {
        static var previews: some View {
            ScheduleDetailView(schedule: tList[1])
        }
    }
}
