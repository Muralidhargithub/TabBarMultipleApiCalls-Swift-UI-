//
//  UserListViewModel.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import Foundation
import SwiftUI

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?

    private let gitDataService: NetworkManager

    init(gitDataService: NetworkManager = NetworkManagerImp.shared) {
        self.gitDataService = gitDataService
    }

    func fetchUsers() async {
        let url = ServerConstants.nationality
        do {
            users = try await gitDataService.getData(url: url)
        } catch {
            errorMessage = "Failed to fetch users: \(error.localizedDescription)"
            print(error)
        }
    }
}
