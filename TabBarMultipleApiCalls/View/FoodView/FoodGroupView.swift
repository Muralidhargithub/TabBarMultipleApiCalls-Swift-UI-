//
//  FoodGroupView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import SwiftUI
struct FoodGroupView: View {
    let foodGroup: FoodGroup
    @ObservedObject var viewModel: FoodViewModel
    @State private var image: UIImage? = nil
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(uiImage: image ?? UIImage(systemName: "photo")!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .onAppear {
                    Task {
                        image = await viewModel.fetchImage(url: foodGroup.image_url ?? "")
                    }
                }

            VStack(alignment: .leading, spacing: 8) {
                Text(foodGroup.name ?? "Unknown Name")
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .blue : .black)
                Text(foodGroup.description ?? "No Description")
                    .font(.subheadline)
                    .foregroundColor(colorScheme == .dark ? .gray : .secondary)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.white)
        .cornerRadius(12)
        .shadow(color: colorScheme == .dark ? Color.white.opacity(0.4) : Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
