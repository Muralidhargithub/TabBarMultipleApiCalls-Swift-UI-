//
//  CharacterDetailView.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var viewModel = CharacterViewModel()
    let subscriber: SubscriberDetails? 
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let character = viewModel.character {
                    CharacterPropertyView(title: "Name", value: character.name)
                    CharacterPropertyView(title: "Height", value: character.height)
                    CharacterPropertyView(title: "Mass", value: character.mass)
                    CharacterPropertyView(title: "Hair Color", value: character.hair_color)
                    CharacterPropertyView(title: "Skin Color", value: character.skin_color)
                    CharacterPropertyView(title: "Eye Color", value: character.eye_color)
                    CharacterPropertyView(title: "Birth Year", value: character.birth_year)
                    CharacterPropertyView(title: "Gender", value: character.gender)
                    CharacterPropertyView(
                        title: "Created",
                        value: viewModel.changeDateFormat(character.created)
                    )
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else if let subscriber = subscriber {
                    CharacterPropertyView(title: "Name", value: subscriber.first_name ?? "Unknown")
                    CharacterPropertyView(title: "Last Name", value: subscriber.last_name ?? "Unknown")
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding()
        }
        .navigationTitle("Character Details")
        .task {
            if subscriber == nil {
                await viewModel.fetchCharacter() // Only fetch if no prefilled subscriber data
            }
        }
    }
}


struct CharacterPropertyView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(title):")
                .fontWeight(.bold)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 5)
    }
}
