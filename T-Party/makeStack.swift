//
//  makeStack.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/12/22.
//

import UIKit
import SwiftUI

func makeStack(data: ListData) -> some View {
    var body: some View{
        HStack(spacing: 100) {
            VStack{
                Image(data.getImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(20)
                .overlay(
                    Text(data.transportType)
                        .font(.system(size:18))
                        .foregroundColor(data.getColor())
                        .fontWeight(.bold)
                        .padding(5),
                    alignment: .bottom)
                Text(data.destination)
                    .font(.system(size:16))
                    .fontWeight(.bold)
            }
                VStack{
                    Text(data.currentStation)
                    Text(data.sched[0])
                    .font(.system(size:35))
                    .fontWeight(.bold)
                    Text(data.sched[1])
                    Text(data.sched[2])
            }
        }
    }
    return body
}


