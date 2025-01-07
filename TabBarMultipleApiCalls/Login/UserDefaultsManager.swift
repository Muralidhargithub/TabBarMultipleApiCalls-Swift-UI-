//
//  UserDefaultsManager.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/7/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let usersKey = "users"

    private init() {}

    func saveUser(username: String, password: String) {
        var users = retrieveAllUsers()
        if users.contains(where: { $0["username"] == username }) {
            print("User already exists. Please use a different username.")
            return
        }

        users.append(["username": username, "password": password])
        UserDefaults.standard.set(users, forKey: usersKey)
    }

    func retrieveAllUsers() -> [[String: String]] {
        return UserDefaults.standard.array(forKey: usersKey) as? [[String: String]] ?? []
    }

    func validateUser(username: String, password: String) -> Bool {
        let users = retrieveAllUsers()
        return users.contains(where: { $0["username"] == username && $0["password"] == password })
    }
}
