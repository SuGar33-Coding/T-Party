//
//  Trains.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/12/22.
//
import Foundation
import JSONAPI

struct TrainDescription: ResourceObjectDescription {
    static let jsonType: String = "line"
    
    struct Attributes: JSONAPI.Attributes {
        let color: Attribute<String>
    }
    
    struct Relationships: JSONAPI.Relationships {
        
    }
}

typealias Train = Resource<TrainDescription>
