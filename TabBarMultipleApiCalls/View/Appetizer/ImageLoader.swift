//
//  ImageLoader.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImp.shared) {
        self.networkManager = networkManager
    }
    
    func load(fromURL url: String) async {
        do {
            let uiImage = try await networkManager.getImage(url: url)
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
    }
}
