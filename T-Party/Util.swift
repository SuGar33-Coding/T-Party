//
//  Util.swift
//  T-Party
//
//  Created by Gabriel Klavans on 11/6/22.
//

import Foundation

let ISO_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ssZ"

func isoStringToDate(dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = ISO_DATE_FORMAT
    return dateFormatter.date(from: dateString) ?? Date()
}

func dateToIsoString(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = ISO_DATE_FORMAT
    return dateFormatter.string(from: date)
}
