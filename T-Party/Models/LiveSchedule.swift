import Foundation
import SwiftUI

@MainActor class LiveSchedule: ObservableObject {
    struct Stop: Codable {
        init() {
            self.name = ""
            self.type = ""
            self.id = UUID().uuidString
        }
        var name: String
        var type: String
        var id: String
    }
    
    struct Schedule: Codable {
        var arrivalTime: String
        var departureTime: String
        var directionId: Int
        var type: String
        var id: String
        var stop: Stop
        
        func getArrivalDate() -> Date {
            return isoStringToDate(dateString: self.arrivalTime)
        }
    }
    
    struct StaticData {
        var color = Color("GLGreen")
        var color2 = Color("GLGreen2")
        var fullName = "Green Line"
        var direction = "Outbound"
        var image: String = "gl4"
    }
    
    @Published var scheduleData: [Schedule]
    private let url: URL
    var staticData: StaticData
    
    init(stopId: String)
    throws {
        let urlString = "\(serverDomain)/schedules/\(stopId)"
        
        guard let urlVal = URL(string: urlString) else {
            throw ApiError.urlError
        }
        self.url = urlVal
        self.scheduleData = [Schedule(arrivalTime: dateToIsoString(date: Date()), departureTime: dateToIsoString(date: Date()), directionId: 0, type: "Train", id: "-1", stop: Stop())]
        self.staticData = StaticData()
    }
    
    convenience init(stopId: String, staticData: StaticData)
    throws {
        try self.init(stopId: stopId)
        self.staticData = staticData

    }
    
    func update() async
    throws {
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: self.url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ApiError.badRequest }
        
        self.scheduleData = try JSONDecoder().decode([Schedule].self, from: data)
        
    }
}
