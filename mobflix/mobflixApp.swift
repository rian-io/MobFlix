//
//  mobflixApp.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

@main
struct mobflixApp: App {
    @StateObject var videosProvider = VideosProvider()
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(videosProvider)
        }
    }
}
