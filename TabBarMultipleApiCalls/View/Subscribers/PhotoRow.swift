//
//  PhotoRow.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct PhotoRow: View {
    let photo: Photo
    let loadImage: (String) async -> UIImage?

    @State private var image: UIImage?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(8)
            } else {
                ProgressView()
                    .frame(height: 200)
                    .task {
                        image = await loadImage(photo.thumbnailUrl ?? "")
                    }
            }

            Text(photo.title ?? "No Title")
                .font(.headline)
                .lineLimit(2)
                .padding(.horizontal)
        }
        .padding(.vertical)
    }
}
