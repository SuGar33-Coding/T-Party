//
//  SingleListItemView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/13/22.
//

import SwiftUI

struct SingleListItemView: View {
    var transportType: String
    var color: Color
    var sched: [String]
    var image: String
    var destination: String
    var currentStation: String
    
    init(thisOne: ListData) {
        self.transportType = thisOne.transportType
        self.color = thisOne.color2
        self.sched = thisOne.sched
        self.image = thisOne.image
        self.destination = thisOne.destination
        self.currentStation = thisOne.currentStation
    }
    
    var body: some View {
        HStack(spacing: 100) {
            VStack{
                Image(self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                    .overlay(
                        Text(self.transportType)
                            .font(.system(size:18))
                            .foregroundColor(self.color)
                            .fontWeight(.bold)
                            .padding(5),
                        alignment: .bottom)
                Text(self.destination)
                    .font(.system(size:16))
                    .fontWeight(.bold)
            }
            VStack{
                Text(self.currentStation)
                Text(self.sched[0])
                    .font(.system(size:35))
                    .fontWeight(.bold)
                Text(self.sched[1])
                Text(self.sched[2])
            }
        }
    }
}

struct SingleListItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListItemView(thisOne: tList[0])
    }
}
