//
//  SubscriberListView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct SubscriberListView: View {
    @StateObject private var viewModel = SubscriberViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.subscribers) { subscriber in
                NavigationLink(destination: SubscriberDetailView(subscriber: subscriber, viewModel: viewModel)) {
                    SubscriberRowView(subscriber: subscriber, viewModel: viewModel)
                }
            }
            .navigationTitle("Subscribers")
            .task {
                await viewModel.fetchSubscribers()
            }
            
        }
    }
}
