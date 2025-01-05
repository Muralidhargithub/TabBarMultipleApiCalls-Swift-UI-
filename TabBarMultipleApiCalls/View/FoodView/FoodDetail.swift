//
//  FoodDetail.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import SwiftUI

struct FoodDetail: View {
    var foodGroup: FoodGroup
    @ObservedObject var viewModel: FoodViewModel
    @State private var searchTerm: String = ""

    var filteredFoodItems: [FoodItem] {
        guard !searchTerm.isEmpty else { return foodGroup.food_items }
        return foodGroup.food_items.filter {
            $0.name?.localizedCaseInsensitiveContains(searchTerm) == true
        }
    }

    var body: some View {
        List(filteredFoodItems, id: \.id) { foodItem in
            FoodItemRow(foodItems: foodItem, viewModel: viewModel)
        }
        .navigationTitle(foodGroup.name ?? "Food Group")
        .searchable(text: $searchTerm, prompt: "Search Food Items")
    }
}
