//
//  Api.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/14/22.
//

import Foundation
import SwiftUI

private enum domains: String {
    case caprover = "https://t-server.cap.dabe.tech"
    case local = "http://localhost:3000"
    case macaria = "http://macaria.local:3000"
    case windows = "http://192.168.88.128:3000"
    case melinoe = "http://melinoe.local:3000"
}

let serverDomain: String = domains.melinoe.rawValue

enum ApiError: Error {
    case urlError
    case badRequest
    case dataParseError
}

// Thanks to https://lukeroberts.co/blog/fetch-data-api/ for this sweet URLSession extension
extension URLSession {
    func fetchData<T: Decodable>(at url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let dataList = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(dataList))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}

struct Api {
    static func fetchAllStops(completion: @escaping (Result<[StopData], Error>) -> Void) {
        let url = URL(string: serverDomain + "/stops")!
        URLSession.shared.fetchData(at: url, completion: completion)
    }
    
    static func fetchAllRoutes(completion: @escaping (Result<[RouteData], Error>) -> Void) {
        let url = URL(string: serverDomain + "/routes")!
        URLSession.shared.fetchData(at: url, completion: completion)
    }
}
