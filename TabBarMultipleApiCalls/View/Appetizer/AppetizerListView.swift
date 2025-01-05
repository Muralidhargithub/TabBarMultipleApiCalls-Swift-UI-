//
//  AppetizerListView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//



import SwiftUI

struct AppetizerListView: View {
    @StateObject private var viewModel = AppetizerListViewModel()
    @State private var searchTerm: String = ""

    var filteredAppetizers: [Appetizer] {
        guard !searchTerm.isEmpty else { return viewModel.appetizers }
        return viewModel.appetizers.filter {
            $0.name.localizedCaseInsensitiveContains(searchTerm)
        }
    }

    var body: some View {
        ZStack {
            NavigationView {
                List(filteredAppetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
                .searchable(text: $searchTerm, prompt: "Search Appetizers")
            }
            .task {
                await viewModel.fetchAppetizers()
            }

            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}
