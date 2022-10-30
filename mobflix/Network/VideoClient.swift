//
//  VideoClient.swift
//  mobflix
//
//  Created by Rian de Oliveira on 29/10/22.
//

import Foundation

actor VideoClient {
    var videos: [Video] {
        get async throws {
            let data = try await downloader.httpData(from: findAllURL)
            let allVideos = try JSONDecoder().decode([Video].self, from: data)
            return allVideos
        }
    }
    
    private let findAllURL = URL(string: "https://placeholder.com")! // TODO url do endpoint
    
    private let downloader: any HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
