//
//  AppetizerListViewModel.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import Foundation
import SwiftUI

@MainActor
final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImp.shared) {
        self.networkManager = networkManager
    }
    
    func fetchAppetizers() async {
        isLoading = true
        do {
            let url = ServerConstants.appetizer
            let response: AppetizerResponse = try await networkManager.getData(url: url)
            appetizers = response.request
        } catch {
            handleNetworkError(error)
        }
        isLoading = false
    }
    
    private func handleNetworkError(_ error: Error) {
        if let networkError = error as? NetworkError {
            switch networkError {
            case .invalidURL:
                alertItem = AlertContext.invalidURL
            case .invalidData:
                alertItem = AlertContext.invalidData
            case .invalidResponse:
                alertItem = AlertContext.invalidResponse
            case .unableToComplete:
                alertItem = AlertContext.unableToComplete
            case .decodingError(let message):
                alertItem = AlertItem(
                    title: Text("Decoding Error"),
                    message: Text("Failed to decode the response: \(message)"),
                    dismissButton: .default(Text("OK"))
                )
            case .invalidImageData:
                alertItem = AlertItem(
                    title: Text("Image Error"),
                    message: Text("The image data received is invalid."),
                    dismissButton: .default(Text("OK"))
                )
            case .networkFailure(let message):
                alertItem = AlertItem(
                    title: Text("Network Error"),
                    message: Text("Network request failed: \(message)"),
                    dismissButton: .default(Text("OK"))
                )
            }
        } else {
            alertItem = AlertItem(
                title: Text("Unknown Error"),
                message: Text("Something went wrong. Please try again later."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

}
