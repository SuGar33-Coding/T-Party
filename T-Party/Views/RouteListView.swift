//
//  RouteListView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 1/15/24.
//

import SwiftUI

struct RouteListView: View {
    @State var routeDataList = [RouteData]()
    
    var body: some View {
        VStack {
            List(routeDataList, id: \.id) { route in
                Text(route.long_name)
            }
        }.onAppear(perform: {
            Api.fetchAllRoutes() { result in
                switch result {
                case .success(let routeDataList):
                    self.routeDataList = routeDataList
                case .failure(let error):
    //                throw ApiError.dataParseError
                    print(error)
                }
            }

        })
    }
}

#Preview {
    RouteListView()
}
