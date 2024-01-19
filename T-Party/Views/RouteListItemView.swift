//
//  RouteListItemView.swift
//  T-Party
//
//  Created by Gabriel Klavans on 1/18/24.
//

import SwiftUI

struct RouteListItemView: View {
    var route: RouteData
    
    var body: some View {
        switch route.type {
        case .lightRail, .heavyRail, .commuterRail, .ferry:
            Text(route.long_name)
        case .bus:
            Text(route.short_name ?? route.long_name)
        }
    }
}

#Preview {
    RouteListItemView(route: mockRoutes[0])
}
