//
//  Route.swift
//  T-Party
//
//  Created by Gabriel Klavans on 1/15/24.
//

import Foundation

enum RouteType: Int, Codable {
    case lightRail = 0, heavyRail, commuterRail, bus, ferry
}

struct RouteData: Codable {
    var id: String
    var long_name: String
    var short_name: String?
    var type: RouteType
    var color: String
    var direction_destinations: [String]? // (String, String)
    var direction_names: [String]? // (String, String)
}
