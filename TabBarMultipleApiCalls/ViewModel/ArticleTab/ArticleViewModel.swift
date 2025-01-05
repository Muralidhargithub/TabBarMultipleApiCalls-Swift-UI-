//
//  ArticleViewModel.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import Foundation
import UIKit

class ArticleViewModel: ObservableObject {
    @Published var articleData: [ArticleDetails] = []
    @Published var isLoading: Bool = false

    let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchData() {
        isLoading = true
        Task {
            do {
                let articles: Article = try await networkManager.getData(url: ServerConstants.article)
                DispatchQueue.main.async {
                    self.articleData = articles.articles
                    self.isLoading = false
                }
            } catch {
                print("Failed to fetch articles: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }

    func fetchImage(url: String) async -> UIImage? {
        do {
            return try await networkManager.getImage(url: url)
        } catch {
            print("Failed to fetch image: \(error)")
            return nil
        }
    }
}
