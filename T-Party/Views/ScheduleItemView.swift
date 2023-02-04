//
//  SingleScheduleItemView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/14/22.
//

import SwiftUI

struct ScheduleItemView: View {
    
    var info: ListData
    var position: Int
    
    init(info: ListData, position: Int) {
        self.info = info
        self.position = position
    }
    
    var body: some View {
            VStack {
                Text(info.sched[position])
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(info.color2)
        }
    }
}
struct ScheduleItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleItemView(info: tList[1], position: 0)
    }
}

