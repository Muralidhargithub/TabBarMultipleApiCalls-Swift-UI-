//
//  FoodItem.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


import SwiftUI

// MARK: - Models
struct FoodItem: Codable, Hashable {
    let id: Int?
    let name: String?
    let description: String?
    let weight: Int?
    let price: Int?
    let image_url: String
}

struct FoodGroup: Codable, Hashable {
    let id: Int?
    let name: String?
    let description: String?
    let image_url: String?
    let food_items: [FoodItem]
}

struct FoodData: Codable, Hashable {
    let food_groups: [FoodGroup]
}
