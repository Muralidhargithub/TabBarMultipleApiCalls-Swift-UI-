//
//  CharacterViewModel.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import Foundation
import SwiftUI

@MainActor
class CharacterViewModel: ObservableObject {
    @Published var character: Character?
    @Published var errorMessage: String?
    
    private let gitDataService: NetworkManager = NetworkManagerImp.shared
    
    func fetchCharacter() async {
        let url = ServerConstants.character
        do {
            let fetchedCharacter: Character = try await gitDataService.getData(url: url)
            character = fetchedCharacter
        } catch {
            errorMessage = "Failed to fetch character: \(error.localizedDescription)"
        }
    }
    
    func changeDateFormat(_ givenDate: String) -> String {
        let input = DateFormatter()
        input.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let output = DateFormatter()
        output.dateFormat = "dd-MM-yy"

        if let date = input.date(from: givenDate) {
            return output.string(from: date)
        } else {
            return givenDate
        }
    }
}
