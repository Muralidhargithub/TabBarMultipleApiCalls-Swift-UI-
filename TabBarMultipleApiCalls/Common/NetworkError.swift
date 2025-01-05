//
//  NetworkError.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


enum NetworkError: Error {
    case invalidURL
    case decodingError(String)
    case invalidImageData
    case networkFailure(String)
    case invalidData
    case invalidResponse
    case unableToComplete

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .decodingError(let message):
            return "Failed to decode the response: \(message)"
        case .invalidImageData:
            return "The image data is invalid."
        case .networkFailure(let message):
            return "Network request failed: \(message)"
        case .invalidData:
            return "The data received is invalid."
        case .invalidResponse:
            return "The server response is invalid."
        case .unableToComplete:
            return "Unable to complete the network request. Please check your internet connection."
        }
    }
}



