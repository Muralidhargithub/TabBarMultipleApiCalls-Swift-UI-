//
//  Currency.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//


struct Currency: Codable {
    let code: String
    let name: String
    let symbol: String?
}

struct Language: Codable {
    let code: String?
    let name: String
}

struct User: Codable, Identifiable {
    var id: String { name } 
    let capital: String
    let code: String
    let currency: Currency
    let flag: String
    let language: Language
    let name: String
    let region: String
}
