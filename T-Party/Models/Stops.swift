import Foundation

class Stops {
    var urlString: String
    var stops: [Stop]
    
    private init(urlString: String) {
        self.urlString = urlString
        self.stops = [Stop(stopData: StopData(id: "", latitude: 0, longitude: 0, name: "", route_type: 0))]
    }
    
    convenience init() {
        self.init(urlString: "\(serverDomain)/stops/")
    }
    
    convenience init(lat: Float, long: Float, radius: Float) async
    throws {
        self.init(urlString: "\(serverDomain)/stops/within/\(lat)/\(long)/\(radius)")
    }
    
    func update() async
    throws {
        guard let urlVal = URL(string: self.urlString) else {
            throw ApiError.urlError
        }
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: urlVal))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ApiError.badRequest }
        
        let stopDataList = try JSONDecoder().decode([StopData].self, from: data)
        
        var stopsMid: [Stop] = []
        
        for stopData in stopDataList {
            if stopData.latitude != nil {
                stopsMid.append(Stop(stopData: stopData))
            }
        }
        self.stops = stopsMid
    }
}
