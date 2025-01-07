//
//  ContentView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//



import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FoodTabView()
                .tabItem {
                    Label("Food", systemImage: "leaf")
                }
            
            ArticleListView()
                .tabItem {
                    Label("Articles", systemImage: "newspaper")
                }

            SubscriberListView()
                .tabItem {
                    Label("Subscribers", systemImage: "person.2")
                }
            
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "person.3.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
        LoginView()
            .environmentObject(AppState())
            .previewDisplayName("Login Screen")


}
