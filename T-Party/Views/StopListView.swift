//
//  StopListView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 1/15/24.
//

import SwiftUI

struct StopListView: View {
    @State var curStops = [StopData]()
    
    var body: some View {
        VStack {
            List(curStops, id: \.id) { stop in
                Text(stop.name)
            }
        }.onAppear(perform: {
            Api.fetchAllStops() { result in
                switch result {
                case .success(let stopDataList):
                    curStops = stopDataList
                case .failure(let error):
                    print(error)
                }
            }

        })
    }
}

#Preview {
    StopListView()
}
