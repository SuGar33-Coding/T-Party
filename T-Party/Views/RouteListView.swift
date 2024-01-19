//
//  RouteListView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 1/15/24.
//

import SwiftUI

struct RouteListView: View {
    @Environment(Preferences.self) var preferences
    @State var routeDataList = [RouteData]()
    @State var showFavoritesOnly = false
    
    var modifiedRouteDataList: [RouteData] {
        routeDataList.filter { routeData in
            (!showFavoritesOnly || preferences.data.favorites.contains(routeData.id))
        }.sorted { // put favorites at the top
            return preferences.data.favorites.contains($0.id) && !preferences.data.favorites.contains($1.id)
        }
    }
    
    var body: some View {
        VStack {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(modifiedRouteDataList, id: \.id) { route in
                    HStack {
                        RouteListItemView(route: route)
                        
                        Spacer()
                        
                        FavoriteButton(isSet: preferences.data.favorites.contains(route.id), routeId: route.id)
                    }
                }
            }
            .animation(.default, value: modifiedRouteDataList)
        }.onAppear(perform: {
            Api.fetchAllRoutes() { result in
                switch result {
                case .success(let routeDataList):
                    self.routeDataList = routeDataList
                case .failure(let error):
                    print(error)
                }
            }

        })
    }
}

#Preview {
    RouteListView()
        .environment(Preferences())
}
