//
//  ListData.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/12/22.
//

import Foundation
import SwiftUI

struct ListData: Identifiable {
    var transportType: String
    var destination: String
    var currentStation: String
    var sched: [String]
    var id = UUID()
    
    func getColor() -> Color {
        var thisColor: Color
        switch(self.transportType){
        case("GL"):
            thisColor = Color("GLGreen")
        case("BL"):
            thisColor = Color("BLBlue")
        case("RL"):
            thisColor = Color("RLRed")
        case("OL"):
            thisColor = Color("OLOrange")
        default:
            thisColor = Color("BusYellow")
        }
        return thisColor
    }
    
    func getColor2() -> Color {
        var thisColor: Color
        switch(self.transportType){
        case("GL"):
            thisColor = Color("GLGreen2")
        case("BL"):
            thisColor = Color("BLBlue2")
        case("RL"):
            thisColor = Color("RLRed2")
        case("OL"):
            thisColor = Color("OLOrange2")
        default:
            thisColor = Color("BusYellow2")
        }
        return thisColor
    }
    
    func getFullName() -> String {
        var thisName: String
        switch(self.transportType){
        case("GL"):
            thisName = "Green Line"
        case("BL"):
            thisName = "Blue Line"
        case("RL"):
            thisName = "Red Line"
        case("OL"):
            thisName = "Orange Line"
        default:
            thisName = self.transportType + " Bus"
        }
        return thisName
    }
    
    func getImage() -> String {
        var thisImage: String
        switch(self.transportType){
        case("GL"):
            thisImage = "gl4"
        case("BL"):
            thisImage = "bl4"
        case("RL"):
            thisImage = "rl4"
        case("OL"):
            thisImage = "ol4"
        default:
            thisImage = "bus4"
        }
        return thisImage
    }
    
    func getBound() -> String {
        return("Outbound")
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




