//
//  FoodTabView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import SwiftUI

struct FoodTabView: View {
    @StateObject private var viewModel = FoodViewModel(networkManager: NetworkManagerImp())
    @State private var showAlert = false
    @State private var navigateToAppetizers = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.foodGroups, id: \.self) { foodGroup in
                    NavigationLink(destination: FoodDetail(foodGroup: foodGroup, viewModel: viewModel)) {
                        FoodGroupView(foodGroup: foodGroup, viewModel: viewModel)
                    }
                }

                Section(header: Text("Starters")) {
                    Button {
                        showAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "fork.knife")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.orange)
                            Text("Appetizers")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }
                    .alert("Special Offer", isPresented: $showAlert) {
                        Button("OK") {
                            navigateToAppetizers = true
                        }
                    } message: {
                        Text("Enjoy a 20% New Year discount on all Appetizers!")
                    }
                }
            }
            .navigationTitle("Food Groups")
            .onAppear {
                viewModel.fetchData()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
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
}
