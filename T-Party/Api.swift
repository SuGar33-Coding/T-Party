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

let serverDomain: String = domains.caprover.rawValue

enum ApiError: Error {
    case urlError
    case badRequest
}
