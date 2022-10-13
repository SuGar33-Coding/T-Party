//
//  Trains.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/12/22.
//

import Foundation

struct Train: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
}

class Api : ObservableObject{
    @Published var trains = [Train]()
    
    func loadData(completion:@escaping ([Train]) -> ()) {
        guard let url = URL(string: "https://api-v3.mbta.com/lines?page%5Boffset%5D=0&page%5Blimit%5D=5&sort=short_name&fields%5Bline%5D=short_name") else {
            print("Invalid url...")
            return
        }
        var urlReq = URLRequest(url: url)
        urlReq.setValue("application/vnd.api+json", forHTTPHeaderField: "accept")
        URLSession.shared.dataTask(with: urlReq) { data, response, error in
            let trains = try! JSONDecoder().decode([Train].self, from: data!)
            print(trains)
            DispatchQueue.main.async {
                completion(trains)
            }
        }.resume()
        
    }
}
