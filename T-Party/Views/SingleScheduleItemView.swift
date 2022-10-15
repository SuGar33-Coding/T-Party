//
//  SingleScheduleItemView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/14/22.
//

import SwiftUI

struct SingleScheduleItemView: View {
    
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
                    .foregroundColor(info.getColor2())
        }
    }
}
struct SingleScheduleItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleScheduleItemView(info: tList[1], position: 0)
            
    }
}

