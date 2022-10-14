//
//  Trains.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/12/22.
//

import Foundation

struct LinesResponse: Codable {
    var data: [Train]
}

struct Train: Codable {
    struct linksStruct: Codable {
        var `self`: String
    }
    struct attributesStruct: Codable {
        var color: String
    }
    
    var attributes: attributesStruct
    var id: String
    var links: linksStruct
    var type: String
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
            let res = try! JSONDecoder().decode(LinesResponse.self, from: data!)
            let trains = res.data
            print(trains)
            DispatchQueue.main.async {
                completion(trains)
            }
        }.resume()
        
    }
}
