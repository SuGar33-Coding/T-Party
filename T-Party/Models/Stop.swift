import Foundation

// TODO: Maybe turn into a class that can fetch info on a single stop

struct Stop: Codable {
    var id: String
    var latitude: Float
    var longitude: Float
    var name: String
}
