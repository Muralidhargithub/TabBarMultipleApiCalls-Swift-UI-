//
//  SubscriberDetails.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import Foundation

struct SubscriberDetails: Codable, Identifiable{
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}

//struct Subscriber: Codable, Identifiable{
//    let data: [SubscriberDetails]
//}
