//
//  UserListView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserListViewModel()
    @State private var searchTerm: String = ""

    var filteredUsers: [User] {
        guard !searchTerm.isEmpty else { return viewModel.users }
        return viewModel.users.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }

    var body: some View {
        NavigationView {
            List(filteredUsers) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    UserRowView(user: user)
                }
            }
            .navigationTitle("Users")
            .searchable(text: $searchTerm, prompt: "Search Users")
            .task {
                await viewModel.fetchUsers()
            }
            .alert("Error", isPresented: .constant(viewModel.errorMessage != nil), actions: {
                Button("OK", role: .cancel) {}
            }, message: {
                Text(viewModel.errorMessage ?? "")
            })
        }
    }
}



































//struct UserListView: View {
//    @StateObject private var viewModel = UserListViewModel()
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.users) { user in
//                NavigationLink(destination: CharacterDetailView(subscriber: convertToSubscriber(user: user))) {
//                    UserRowView(user: user)
//                }
//            }
//            .navigationTitle("Users")
//            .task {
//                await viewModel.fetchUsers()
//            }
//            .alert("Error", isPresented: .constant(viewModel.errorMessage != nil), actions: {
//                Button("OK", role: .cancel) {}
//            }, message: {
//                Text(viewModel.errorMessage ?? "")
//            })
//        }
//    }
//    
//    private func convertToSubscriber(user: User) -> SubscriberDetails {
//        SubscriberDetails(
//            id: Int(user.code.hashValue),
//            email: "\(user.name.lowercased())@example.com",
//            first_name: user.name,
//            last_name: user.capital,
//            avatar: user.flag
//        )
//    }
//}
