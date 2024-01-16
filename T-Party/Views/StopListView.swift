//
//  StopListView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 1/15/24.
//

import SwiftUI

struct StopListView: View {
    @State var curStops = [Stop]()
//    var curStops = mockStops

    
    var body: some View {
        VStack {
            List(curStops, id: \.id) { stop in
                Text(stop.stopName)
            }
        }.onAppear(perform: {
            let url = URL(string: serverDomain + "/stops")!
            URLSession.shared.fetchData(at: url) { result in
                let stops: [Stop] = []
                switch result {
                case .success(let stopDataList):
                    for stopData in stopDataList {
                        curStops.append(Stop(stopData: stopData))
                    }
                case .failure(let error):
    //                throw ApiError.dataParseError
                    print("uh oh")
                }
            }

        })
    }
}

#Preview {
    StopListView()
}
