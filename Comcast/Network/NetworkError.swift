//
//  NetworkError.swift
//  Comcast
//
//  Created by Hanh Vo on 10/24/23.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
    case serverError(statusCode: Int)
    case unknownError
    
    var description: String {
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .noData:
            return "No data was received."
        case .decodingError(let error):
            return "An error occurred while decoding the data. \(error.localizedDescription)"
        case .serverError(let statusCode):
            return "Server returned an error with status code: \(statusCode)."
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
