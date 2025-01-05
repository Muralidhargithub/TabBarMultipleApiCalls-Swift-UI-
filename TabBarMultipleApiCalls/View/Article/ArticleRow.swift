//
//  ArticleRow.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import SwiftUI

struct ArticleRow: View {
    let article: ArticleDetails

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                } else {
                    Image("placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(article.title ?? "No Title")
                    .font(.headline)
                    .lineLimit(2)
                Text("Author: \(article.author ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Published At: \(article.publishedAt ?? "Unknown")")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}
