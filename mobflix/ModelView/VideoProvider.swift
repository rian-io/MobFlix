//
//  VideoProvider.swift
//  mobflix
//
//  Created by Rian de Oliveira on 29/10/22.
//

import Foundation

final class VideosProvider: ObservableObject {
    
    @Published var videos: [Video] = []
    @Published var featuredVideo = Video()
    
    let client: VideoClient
    
    init(client: VideoClient = VideoClient()) {
        self.client = client
    }
    
    func fetchVideos() async throws {
        var allVideos = try await client.videos
        var video = Video()
        
        if !allVideos.isEmpty { video = allVideos.removeFirst() }
                
        self.videos = allVideos
        self.featuredVideo = video
    }
}
