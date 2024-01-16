import Foundation
import CoreLocation

// TODO: Maybe turn into a class that can fetch info on a single stop

struct StopData: Codable {
    var id: String
    var latitude: Float
    var longitude: Float
    var name: String
    var route_type: Int
}

class Stop: Identifiable {
    var stopData: StopData
    var coords: CLLocationCoordinate2D
    var stopName: String
    var routeType: String
    let id = UUID()
    init(stopData: StopData) {
        self.stopData = stopData
        self.stopName = stopData.name
        self.coords = CLLocationCoordinate2D(latitude: Double(stopData.latitude), longitude: Double(stopData.longitude))
        switch stopData.route_type {
        // TODO: Figure out all the cases besides 3
        case(0):
            routeType = "T"
        case(1):
            routeType = "T"
        case(3):
            routeType = "Bus"
        default:
            routeType = "Oops"
        }
    }
}
