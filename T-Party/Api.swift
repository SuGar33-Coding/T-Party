//
//  Api.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/14/22.
//

import Foundation
import JSONAPI

typealias Resource<Description: JSONAPI.ResourceObjectDescription> = JSONAPI.ResourceObject<Description, NoMetadata, NoLinks, String>
typealias BatchDocument<Resource: ResourceObjectType> = JSONAPI.Document<ManyResourceBody<Resource>, NoMetadata, NoLinks, NoIncludes, NoAPIDescription, UnknownJSONAPIError>


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
