//
//  ListData.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/12/22.
//

import Foundation
import SwiftUI

struct ListData {
    var transportType: String
    var destination: String
    var color: Color
    var currentStation: String
    var image: String
    var sched: [String]
}

struct Mega {
    var tLists: ListData
}

var tList = [ListData(transportType: "OL", destination: "Forest Hills", color: Color("OLOrange"), currentStation: "Ruggles", image: "ol4", sched: ["4 min", "16 min", "21 min"]), ListData(transportType: "BL", destination: "Wonderland", color: Color("BLBlue"), currentStation: "Aquarium", image: "bl4", sched: ["7 min", "19 min", "23 min"]), ListData(transportType: "64", destination: "Oak Square", color: Color("BusYellow"), currentStation: "Wash @ Cam", image: "bus4", sched: ["11 min", "19 min", "27 min"]), ListData(transportType: "GL", destination: "Boston College", color: Color("GLGreen"), currentStation: "Babcock St", image: "gl4", sched: ["14 min", "28 min", "31 min"]), ListData(transportType: "66", destination: "Harvard", color: Color("BusYellow"), currentStation: "Nubian", image: "bus4", sched: ["19 min", "24 min", "39 min"]), ListData(transportType: "RL", destination: "Braintree", color: Color("RLRed"), currentStation: "Harvard", image: "rl4", sched: ["31 min", "38 min", "44 min"]), ListData(transportType: "57", destination: "Kenmore", color: Color("BusYellow"), currentStation: "Comm @ Elko", image: "bus4", sched: ["32 min", "46 min", "52 min"]), ]

