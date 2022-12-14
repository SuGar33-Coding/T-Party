//
//  ScheduleView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/13/22.
//

import SwiftUI

struct ScheduleView: View {
    
    var senderKey: ListData
    
    init(senderKey: ListData) {
        self.senderKey = senderKey
    }
    
    var body: some View {
        ZStack{
            VStack{
                Text(senderKey.fullName)
                    .font(.system(size:50))
                    .foregroundColor(self.senderKey.color2)
                    .fontWeight(.bold)
                Text(senderKey.direction + " to " + senderKey.destination)
                    .font(.system(size:24))
                Text("Arriving to " + senderKey.currentStation + " in").italic()
                ScrollView{
                    let schedSize = senderKey.sched.count
                    ForEach(0..<schedSize, id: \.self) { pos in
                        SingleScheduleItemView(info: senderKey, position: pos)
                }
            }
        }
    }
}
                            }
    struct ScheduleView_Previews: PreviewProvider {
        static var previews: some View {
            ScheduleView(senderKey: tList[1])
        }
    }
