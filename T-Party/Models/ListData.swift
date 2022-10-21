//
//  ListData.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/12/22.
//

import Foundation
import SwiftUI

struct ListData {
    let transportType: String
    let destination: String
    let currentStation: String
    let sched: [String]
    let id = UUID()
    
    var color: Color {
        switch(transportType) {
        case("GL"):
            return Color("GLGreen")
        case("BL"):
            return Color("BLBlue")
        case("RL"):
            return Color("RLRed")
        case("OL"):
            return Color("OLOrange")
        default:
            return Color("BusYellow")
        }
    }
    
    var color2: Color {
        switch(transportType) {
        case("GL"):
            return Color("GLGreen2")
        case("BL"):
            return Color("BLBlue2")
        case("RL"):
            return Color("RLRed2")
        case("OL"):
            return Color("OLOrange2")
        default:
            return Color("BusYellow2")
        }
    }
    
    var fullName: String {
        switch(transportType) {
        case("GL"):
            return "Green Line"
        case("BL"):
            return "Blue Line"
        case("RL"):
            return "Red Line"
        case("OL"):
            return "Orange Line"
        default:
            return transportType + " Bus"
        }
    }
    
    var image: String {
        switch(transportType) {
        case("GL"):
            return "gl4"
        case("BL"):
            return "bl4"
        case("RL"):
            return "rl4"
        case("OL"):
            return "ol4"
        default:
            return "bus4"
        }
    }
    
    var direction: String {
        return "Outbound"
    }
}

var tList = [
    ListData(
        transportType: "OL",
        destination: "Forest Hills",
        currentStation: "Ruggles",
        sched: [
            "4 min",
            "16 min",
            "21 min",
            "27 min",
            "32 min",
            "46 min",
        ]
    ),
    ListData(
        transportType: "BL",
        destination: "Wonderland",
        currentStation: "Aquarium",
        sched: [
            "7 min",
            "19 min",
            "23 min",
            "25 min",
            "34 min",
            "36 min"]
    ),
    ListData(
        transportType: "64",
        destination: "Oak Square",
        currentStation: "Wash @ Cam",
        sched: [
            "11 min",
            "19 min",
            "27 min",
            "28 min",
            "29 min",
            "34 min"
        ]
    ),
    ListData(
        transportType: "GL",
        destination: "Boston College",
        currentStation: "Babcock St",
        sched: [
            "14 min",
            "28 min",
            "31 min",
            "34 min",
            "39 min",
            "42 min"
        ]
    ),
    ListData(
        transportType: "66",
        destination: "Harvard",
        currentStation: "Nubian",
        sched: [
            "19 min",
            "24 min",
            "39 min",
            "48 min",
            "49 min",
            "54 min"
        ]
    ),
    ListData(
        transportType: "RL",
        destination: "Braintree",
        currentStation: "Harvard",
        sched: [
            "31 min",
            "38 min",
            "44 min",
            "47 min",
            "49 min",
            "53 min"
        ]
    ),
    ListData(
        transportType: "57",
        destination: "Kenmore",
        currentStation: "Comm @ Elko",
        sched: [
            "32 min",
            "46 min",
            "52 min",
            "59 min",
            "69 min",
            "420 min"
        ]
    ),
    
    ListData(
        transportType: "GL",
        destination: "Kenmore",
        currentStation: "BU East",
        sched: [
            "12 min",
            "16 min",
            "22 min",
            "29 min",
            "69 min",
            "420 min"
        ]
    ),
    
    ListData(
        transportType: "GL",
        destination: "Boston College",
        currentStation: "BU East",
        sched: [
            "7 min",
            "12 min",
            "20 min",
            "34 min",
            "40 min",
            "90 min"
        ]
    ),
]


