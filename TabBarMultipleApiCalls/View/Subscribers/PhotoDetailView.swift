//
//  PhotoDetailView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct PhotoDetailView: View {
    let photo: Photo
    let loadImage: (String) async -> UIImage?

    @State private var image: UIImage?

    var body: some View {
        VStack(spacing: 16) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
            } else {
                ProgressView()
                    .task {
                        image = await loadImage(photo.url ?? "")
                    }
            }

            Text("Photo ID: \(photo.id ?? 0)")
                .font(.headline)

            Text("Album ID: \(photo.albumId ?? 0)")
                .font(.subheadline)

            Text(photo.title ?? "No Title")
                .padding()
        }
        .navigationTitle("Photo Details")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}
