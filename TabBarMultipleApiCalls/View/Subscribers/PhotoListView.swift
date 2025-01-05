//
//  PhotoListView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct PhotoListView: View {
    @StateObject private var viewModel = PhotoViewModel(networkManager: NetworkManagerImp.shared)

    var body: some View {
        NavigationView {
            List(viewModel.photos, id: \.id) { photo in
                NavigationLink(
                    destination: PhotoDetailView(photo: photo, loadImage: viewModel.loadImage)
                ) {
                    PhotoRow(photo: photo, loadImage: viewModel.loadImage)
                }
            }
            .navigationTitle("Photos")
            .task {
                await viewModel.fetchPhotos()
                
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? ""),
                    dismissButton: .default(Text("OK")) {
                        viewModel.errorMessage = nil
                    }
                )
            }
        }
    }
}
