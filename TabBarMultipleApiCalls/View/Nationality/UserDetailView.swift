//
//  UserDetailView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct UserDetailView: View {
    let user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(user.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Divider()
                Text("Capital: \(user.capital)")
                Text("Region: \(user.region)")
                Text("Currency: \(user.currency.name) (\(user.currency.code))")
                if let symbol = user.currency.symbol {
                    Text("Currency Symbol: \(symbol)")
                }
                Text("Language: \(user.language.name) (\(user.language.code ?? "N/A"))")
            }
            .padding()
        }
    }
}
