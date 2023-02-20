//
//  AnnotationList.swift
//  T-Party
//
//  Created by Emily Mallaber on 2/19/23.
//

import MapKit

class AnnotationList {
    var annotations: [Stop]
    var visibleAnnotations: [Stop]
    
    init(annotations: [Stop]) {
        self.annotations = annotations
        self.visibleAnnotations = annotations
    }
    
    func resetAnnotations(showT: Bool, showBus: Bool) {
        visibleAnnotations = []
        for stop in annotations {
            if stop.routeType == "T" {
                if(showT){
                    visibleAnnotations.append(stop)
                }
            }
            if stop.routeType == "Bus" {
                if(showBus){
                    visibleAnnotations.append(stop)
                }
            }
        }
        print(self.visibleAnnotations)
    }
}
