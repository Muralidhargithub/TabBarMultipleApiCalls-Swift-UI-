//
//  UserRowView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct UserRowView: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(user.name)
                .font(.headline)
            Text("Capital: \(user.capital)")
                .font(.subheadline)
            Text("Region: \(user.region)")
                .font(.subheadline)
        }
        .padding(.vertical, 5)
    }
}
