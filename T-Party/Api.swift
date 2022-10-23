//
//  Api.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/14/22.
//
import Foundation
import JSONAPI
import SwiftUI

typealias Resource<Description: JSONAPI.ResourceObjectDescription> = JSONAPI.ResourceObject<Description, NoMetadata, NoLinks, String>
typealias BatchDocument<Resource: ResourceObjectType> = JSONAPI.Document<ManyResourceBody<Resource>, NoMetadata, NoLinks, NoIncludes, NoAPIDescription, UnknownJSONAPIError>

enum ApiError: Error {
    case urlError
    case badRequest
}

class Api : ObservableObject{
    @Published var trains = [Train]()
    
    func loadData(completion:@escaping ([Train]) -> ()) {
        guard let url = URL(string: "https://api-v3.mbta.com/lines?page%5Boffset%5D=0&page%5Blimit%5D=5&fields%5Bline%5D=color") else {
            print("Invalid url...")
            return
        }
        var urlReq = URLRequest(url: url)
        urlReq.setValue("application/vnd.api+json", forHTTPHeaderField: "accept")
        URLSession.shared.dataTask(with: urlReq) { data, response, error in
            let res = try! JSONDecoder().decode(BatchDocument<Train>.self, from: data!)
            let trains = res.body.primaryResource!.values
            for train in trains {
                print("train: \(train.id) color: \(train.color)")
                print(train.links)
            }
            DispatchQueue.main.async {
                completion(trains)
            }
        }.resume()
        
    }
}

struct Schedule: Codable {
    var arrivalTime: String
    var departureTime: String
    var directionId: Int
    var type: String
    var id: String
    struct stop: Codable {
        var name: String
        var type: String
        var id: String
    }
}

@MainActor class LiveSchedule: ObservableObject {
    @Published var scheduleData: [Schedule]
    @Published var arrivalDates: [Date]
    @Published var oneArrivalDate: Date
    private let url: URL
    var color = Color("GLGreen")
    var color2 = Color("GLGreen2")
    var fullName = "Green Line"
    var direction = "Outbound"
    var image: String = "gl4"
    
    init(stopId: String)
    throws {
        let urlString = "http://192.168.0.232:3000/schedules/\(stopId)"
        guard let urlVal = URL(string: urlString) else {
            throw ApiError.urlError
        }
        self.url = urlVal
        self.scheduleData = [Schedule(arrivalTime: "00:00:00", departureTime: "59:59:59", directionId: 0, type: "Train", id: "-1")]
        self.arrivalDates = [Date()]
        self.oneArrivalDate = Date()
    }
    
    func update() async
    throws {
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: self.url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ApiError.badRequest }
        
        self.scheduleData = try JSONDecoder().decode([Schedule].self, from: data)
        //        self.scheduleData.forEach { schedule in
        //            let dateFormatter = DateFormatter()
        //            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        //            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        //            self.arrivalDate = dateFormatter.date(from: schedule.arrivalTime)!
        //        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let arrivalDate = dateFormatter.date(from: self.scheduleData[0].arrivalTime)!
        self.oneArrivalDate = arrivalDate
        self.arrivalDates = []
        self.scheduleData.forEach { schedule in
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let arrivalDate = dateFormatter.date(from: schedule.arrivalTime)!
            self.arrivalDates.append(arrivalDate)
        }
    }
    
}
