//
//  SubscriberRowView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct SubscriberRowView: View {
    let subscriber: SubscriberDetails
    @ObservedObject var viewModel: SubscriberViewModel
    @State private var avatarImage: UIImage? = nil
    
    var body: some View {
        HStack {
            if let avatarImage = avatarImage {
                Image(uiImage: avatarImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(subscriber.first_name ?? "Unknown")
                    .font(.headline)
                Text(subscriber.email ?? "No Email")
                    .font(.subheadline)
            }
        }
        .task {
            if let avatarURL = subscriber.avatar {
                avatarImage = await viewModel.loadImage(from: avatarURL)
            }
        }
    }
}
