//
//  SubscriberViewModel.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//



import Foundation
import SwiftUI

class SubscriberViewModel: ObservableObject {
    @Published var subscribers: [SubscriberDetails] = []
    @Published var errorMessage: String?
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImp.shared) {
        self.networkManager = networkManager
    }
    
    func fetchSubscribers() async {
        let url = ServerConstants.subscriber
        do {
            struct ResponseWrapper: Decodable {
                let data: [SubscriberDetails]
            }
            
            let result: ResponseWrapper = try await networkManager.getData(url: url)
            print("Fetched subscribers: \(result.data)")
            self.subscribers = result.data
        } catch {
            self.errorMessage = "Failed to fetch subscribers: \(error.localizedDescription)"
            print("Error fetching subscribers: \(error)")
        }
    }
    
    func loadImage(from urlString: String) async -> UIImage? {
        do {
            return try await networkManager.getImage(url: urlString)
        } catch {
            print("Failed to load image: \(error.localizedDescription)")
            return nil
        }
    }
}

