//
//  VideoItem.swift
//  mobflix
//
//  Created by Rian de Oliveira on 29/10/22.
//

import SwiftUI

struct VideoItem: View {
    var video: Video
    
    var body: some View {
        VStack(alignment: .leading) {
            CategoryBadge(category: video.category)
            
            AsyncImage(url: URL(string: getYoutubeImageURL(from: video.url))) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 320, height: 180, alignment: .center)
                    .clipped()
            } placeholder: {
                Color.gray
            }
            .frame(width: 320, height: 180)
        }
    }
}

extension VideoItem {
    func getYoutubeImageURL(from videoUrl: String) -> String {
        let videoID: String = URLComponents(string: videoUrl)?.queryItems?.first(where: { $0.name == "v" })?.value ?? ""
        return "https://img.youtube.com/vi/\(videoID)/hqdefault.jpg"
    }
}

struct VideoItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoItem(video: Video(
            id: "",
            title: "",
            category: .frontend,
            url: "https://www.youtube.com/watch?v=94yuIVdoevc")
        )
    }
}
