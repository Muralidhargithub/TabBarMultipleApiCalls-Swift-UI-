//
//  FoodViewModel.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import Foundation
import UIKit

class FoodViewModel: ObservableObject {
    @Published var foodGroups: [FoodGroup] = []
    @Published var isLoading: Bool = false
    
    let networkManager: NetworkManager
    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchData() {
        isLoading = true
        Task {
            do {
                let storedData: FoodData = try await networkManager.getData(url: ServerConstants.serverURL)
                DispatchQueue.main.async {
                    self.foodGroups = storedData.food_groups
                    self.isLoading = false
                }
            }catch {
                print("cant able to fetch the data \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
        
    }
    func fetchImage(url: String) async -> UIImage? {
        do {
            return try await networkManager.getImage(url: url)
        }
        catch {
            return nil
        }
    }
}
