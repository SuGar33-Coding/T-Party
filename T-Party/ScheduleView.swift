//
//  ScheduleView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/12/22.
//

import Foundation
import SwiftUI


struct ScheduleView: View {
    var lineCode = "OL"
    var lineColor = "OLOrange"
    var lineDestination = "Forest Hills"
    var body: some View {
        ZStack(alignment: .top){
            padding(50)
            VStack(alignment: .leading){
                Text("ORANGE LINE SCHEDULE HERE")
                    .font(.system(size:20))
            }
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
