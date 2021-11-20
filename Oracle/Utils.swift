//
//  Utils.swift
//  Oracle
//
//  Created by Lee, Christopher on 11/20/21.
//

import Foundation

enum URLError: Error {
    case BadURL
    case NotImplementedYet
}

let session: URLSession = {
    return URLSession(configuration: URLSessionConfiguration.default)
}()

extension NumberFormatter {
    
    func currency(with price: Double, code: String) -> String {
        usesGroupingSeparator = true
        numberStyle = .currency
        currencyCode = code
        return string(from: NSNumber(value: price)) ?? ""
    }
}
