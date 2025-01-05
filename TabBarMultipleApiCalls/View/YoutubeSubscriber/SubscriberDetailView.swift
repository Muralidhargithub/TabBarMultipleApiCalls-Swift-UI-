//
//  SubscriberDetailView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct SubscriberDetailView: View {
    let subscriber: SubscriberDetails
    @ObservedObject var viewModel: SubscriberViewModel
    @State private var avatarImage: UIImage? = nil
    
    var body: some View {
        VStack {
            if let avatarImage = avatarImage {
                Image(uiImage: avatarImage)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 200, height: 200)
            }
            
            Text("ID: \(subscriber.id ?? 0)")
            Text("Email: \(subscriber.email ?? "Unknown")")
            Text("Name: \(subscriber.first_name ?? "") \(subscriber.last_name ?? "")")
        }
        .padding()
        .task {
            if let avatarURL = subscriber.avatar {
                avatarImage = await viewModel.loadImage(from: avatarURL)
            }
        }
    }
}
