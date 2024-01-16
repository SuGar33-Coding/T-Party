import Foundation
import CoreLocation

// TODO: Maybe turn into a class that can fetch info on a single stop

struct StopData: Codable {
    var id: String
    var latitude: Float
    var longitude: Float
    var name: String
    var route: RouteData
}

class Stop: Identifiable {
    var stopData: StopData
    var coords: CLLocationCoordinate2D
    var stopName: String
    let id = UUID()
    init(stopData: StopData) {
        self.stopData = stopData
        self.stopName = stopData.name
        self.coords = CLLocationCoordinate2D(latitude: Double(stopData.latitude), longitude: Double(stopData.longitude))
    }
}
