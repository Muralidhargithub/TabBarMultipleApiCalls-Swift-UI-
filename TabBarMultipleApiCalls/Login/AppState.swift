//
//  AppState.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/7/25.
//


import SwiftUI

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false // Default is false

    func logIn() {
        isLoggedIn = true
    }

    func logOut() {
        isLoggedIn = false
    }
}
