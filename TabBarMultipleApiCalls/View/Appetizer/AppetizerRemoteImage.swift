//
//  AppetizerRemoteImage.swift
//  TabBarMultipleApiCalls
//
//  Created by Muralidhar reddy Kakanuru on 1/5/25.
//

import SwiftUI
struct AppetizerRemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                await imageLoader.load(fromURL: urlString)
            }
    }
}
