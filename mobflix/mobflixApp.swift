//
//  mobflixApp.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

@main
struct mobflixApp: App {
    var body: some Scene {
        let decoder = JSONDecoder()
        let videos: [Video] = try! decoder.decode([Video].self, from: testData)
        let video = videos.first!
        
        WindowGroup {
            Home(videoFeatured: video, videos: videos)
        }
    }
}
