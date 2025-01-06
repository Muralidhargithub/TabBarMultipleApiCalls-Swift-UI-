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
    @State private var showAlert = false
    @State private var navigateToAppetizers = false

    var filteredFoodItems: [FoodItem] {
        guard !searchTerm.isEmpty else { return foodGroup.food_items }
        return foodGroup.food_items.filter {
            $0.name?.localizedCaseInsensitiveContains(searchTerm) == true
        }
    }

    var body: some View {
        VStack {
            List(filteredFoodItems, id: \.id) { foodItem in
                FoodItemRow(foodItems: foodItem, viewModel: viewModel)
            }
            .navigationTitle(foodGroup.name ?? "Food Group")
            .searchable(text: $searchTerm, prompt: "Search Food Items")
            
            Button {
                showAlert = true
            } label: {
                HStack {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.orange)
                    Text("View Appetizers")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .alert("Special Offer", isPresented: $showAlert) {
                Button("OK") {
                    navigateToAppetizers = true
                }
            } message: {
                Text("Enjoy a 20% New Year discount on all Appetizers!")
            }
        }
        .background(
            NavigationLink(
                destination: AppetizerListView(),
                isActive: $navigateToAppetizers,
                label: { EmptyView() }
            )
        )
    }
}
