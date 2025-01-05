//
//  Appetizer.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import Foundation

struct Appetizer: Identifiable, Decodable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: String
    let description: String
    let calories: Int
    let carbs: Int
    let protein: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}
