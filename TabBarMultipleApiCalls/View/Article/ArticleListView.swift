//
//  ArticleListView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

//import SwiftUI
//struct ArticleListView: View {
//    @StateObject private var viewModel = ArticleViewModel(networkManager: NetworkManagerImp())
//    @State private var searchTerm: String = ""
//
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.articleData, id: \.url) { article in
//                NavigationLink(destination: ArticleDetailView(article: article)) {
//                    ArticleRow(article: article)
//                }
//            }
//            .navigationTitle("Articles")
//            .onAppear {
//                 viewModel.fetchData()
//            }
//            .overlay {
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                        .progressViewStyle(CircularProgressViewStyle())
//                }
//            }
//        }
//    }
//}

import SwiftUI

struct ArticleListView: View {
    @StateObject private var viewModel = ArticleViewModel(networkManager: NetworkManagerImp())
    @State private var searchTerm: String = ""

    var filteredArticles: [ArticleDetails] {
        guard !searchTerm.isEmpty else { return viewModel.articleData }
        return viewModel.articleData.filter { $0.title?.localizedCaseInsensitiveContains(searchTerm) == true}
    }

    var body: some View {
        NavigationView {
            List(filteredArticles, id: \.url) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    ArticleRow(article: article)
                }
            }
            .navigationTitle("Articles")
            .searchable(text: $searchTerm, prompt: "Search Articles")
            .onAppear {
                viewModel.fetchData()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
}
