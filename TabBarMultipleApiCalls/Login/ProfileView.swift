//
//  ProfileView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/7/25.
//


import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)

            Button("Logout") {
                appState.logOut() 
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

