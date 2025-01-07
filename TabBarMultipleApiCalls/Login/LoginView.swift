//
//  LoginView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/7/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var navigateToContentView = false // For navigating to ContentView
    @State private var showRegisterView = false // For presenting RegisterView

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()

                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.horizontal)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                Button("Login") {
                    login()
                }
                .buttonStyle(.borderedProminent)

                Button("Create Account") {
                    showRegisterView = true // Show RegisterView
                }
                .padding(.top, 10)
                .sheet(isPresented: $showRegisterView) {
                    RegisterView(isPresented: $showRegisterView)
                }

                // NavigationLink for manual navigation to ContentView
                NavigationLink(
                    destination: ContentView(),
                    isActive: $navigateToContentView
                ) {
                    EmptyView()
                }
            }
            .padding()
        }
    }

    private func login() {
        if UserDefaultsManager.shared.validateUser(username: username, password: password) {
            errorMessage = nil // Clear the error message
            navigateToContentView = true // Navigate to Tab Bar
        } else {
            errorMessage = "Invalid username or password"
        }
    }
}


#Preview {
    LoginView()
        .environmentObject(AppState())
}
