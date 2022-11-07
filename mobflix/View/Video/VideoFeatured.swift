//
//  VideoFeatured.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct VideoFeatured: View {
    var video: Video
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: URL(string: getYoutubeImageURL(from: video.url))) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 390, height: 180)
                    .clipped()
            } placeholder: {
                Color.gray
            }
            .frame(width: 390, height: 180)
            
            if (!video.url.isEmpty) {
                Link(destination: URL(string: getYoutubeWatchURL(from: video.url))!, label: {
                    Text("Assistir agora")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(10)
                        .background(Theme.primary.colour)
                        .cornerRadius(10)
                        .offset(y: 50)
                })
            }
        }
    }
}

extension VideoFeatured {
    func getYoutubeImageURL(from videoId: String) -> String {
        return "https://img.youtube.com/vi/\(videoId)/hqdefault.jpg"
    }
    
    func getYoutubeWatchURL(from videoId: String) -> String {
        return "https://www.youtube.com/watch?v=\(videoId)"
    }
}

struct VideoFeatured_Previews: PreviewProvider {    
    static var previews: some View {
        VideoFeatured(video: Video.preview)
            .previewLayout(.sizeThatFits)
    }
}
