//
//  PhotoViewModel.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import Foundation
import SwiftUI
class PhotoViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager = NetworkManagerImp.shared) {
        self.networkManager = networkManager
    }

    func fetchPhotos() async {
        isLoading = true
        do {
            let fetchedPhotos: [Photo] = try await networkManager.getData(url: ServerConstants.photos)
            self.photos = fetchedPhotos
        } catch {
            self.errorMessage = "Failed to fetch photos: \(error.localizedDescription)"
        }
        isLoading = false
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
