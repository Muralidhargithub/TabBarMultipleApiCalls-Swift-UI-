//
//  ArticleDetailView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct ArticleDetailView: View {
    let article: ArticleDetails

    @State private var image: UIImage? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(8)
                } else {
                    ProgressView()
                        .frame(height: 200)
                }

                Text(article.title ?? "No Title")
                    .font(.title)
                    .multilineTextAlignment(.center)

                Text("By \(article.author ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(article.description ?? "No Description")
                    .padding()

                Spacer()
            }
            .padding()
        }
        .onAppear {
            Task {
                if let urlString = article.urlToImage, let url = URL(string: urlString) {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        if let image = UIImage(data: data) {
                            self.image = image
                        }
                    } catch {
                        print("Failed to load image: \(error.localizedDescription)")
                    }
                }
            }
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
