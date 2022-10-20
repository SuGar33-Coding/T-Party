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
                Text(senderKey.getFullName())
                    .font(.system(size:50))
                    .foregroundColor(self.senderKey.getColor2())
                    .fontWeight(.bold)
                Text(senderKey.getBound() + " to " + senderKey.destination)
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
