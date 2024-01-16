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

extension URLSession {
    func fetchData(at url: URL, completion: @escaping (Result<[StopData], Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let stopDataList = try JSONDecoder().decode([StopData].self, from: data)
                    completion(.success(stopDataList))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}

class ApiCall {
//    func fetchAllStops() {
//        return URLSession.shared.fetchData(at: <#T##URL#>, completion: <#T##(Result<[StopData], Error>) -> Void#>)
//    }
}
