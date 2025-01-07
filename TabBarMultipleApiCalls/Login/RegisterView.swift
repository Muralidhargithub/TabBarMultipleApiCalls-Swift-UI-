//
//  RegisterView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/7/25.
//

import SwiftUI

struct RegisterView: View {
    @Binding var isPresented: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
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

            Button("Register") {
                register()
            }
            .buttonStyle(.borderedProminent)

            Button("Cancel") {
                isPresented = false // Dismiss RegisterView
            }
        }
        .padding()
    }

    private func register() {
        if username.isEmpty || password.isEmpty {
            errorMessage = "Username and password cannot be empty."
        } else {
            UserDefaultsManager.shared.saveUser(username: username, password: password)
            isPresented = false // Dismiss RegisterView after saving credentials
        }
    }
}
