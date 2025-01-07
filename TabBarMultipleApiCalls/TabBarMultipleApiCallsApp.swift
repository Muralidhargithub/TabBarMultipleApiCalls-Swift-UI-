//
//  TabBarMultipleApiCallsApp.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI


@main
struct TabBarMultipleApiCalls: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(appState)
        }
    }
}
