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
        Text(self.senderKey.transportType)
            .font(.system(size:80))
            .foregroundColor(self.senderKey.getColor2())
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(senderKey:
                        ListData(
                            transportType: "OL",
                            destination: "Forest Hills",
                            currentStation: "Ruggles",
                            sched: [
                                "4 min",
                                "16 min",
                                "21 min"
            ]
        ))
    }
}
