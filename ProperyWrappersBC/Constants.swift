//
//  Constants.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation


enum HTTPError: Error {
    case invalidURL
    case DecodedFail
    case noData
}


extension HTTPError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL, Please check with RocadeSupport Team"
        case .DecodedFail:
            return "Decoded Failed"
        case .noData:
            return "No Data found"
        }
    }
}
