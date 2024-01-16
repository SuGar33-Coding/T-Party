import Foundation

class Stops {
    var urlString: String
    var stops: [Stop] = []
    
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
        let url = URL(string: urlString)!
//        URLSession.shared.fetchData(at: url) { result in
//            switch result {
//            case .success(let stopDataList):
//                for stopData in stopDataList {
//                    self.stops.append(Stop(stopData: <#T##StopData#>))
//                }
//            case .failure(let error):
////                throw ApiError.dataParseError
//                print("uh oh")
//            }
//        }
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ApiError.badRequest }
//        
//        let stopDataList: [StopData]
//        do {
//            stopDataList = try JSONDecoder().decode([StopData].self, from: data)
//        } catch let decoderError {
//            throw decoderError
//        }
//        
//        var stopsMid: [Stop] = []
//        
//        for stopData in stopDataList {
//            print("stopData:")
//            print(stopData.id)
//            if stopData.latitude != nil {
//                print("appending")
//                stopsMid.append(Stop(stopData: stopData))
//            }
//        }
//        self.stops = stopsMid
//        print("Total stops:")
//        print(self.stops.count)
    }
}
