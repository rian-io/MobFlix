//
//  VideoItem.swift
//  mobflix
//
//  Created by Rian de Oliveira on 29/10/22.
//

import SwiftUI

struct VideoItemList: View {
    var video: Video
    
    var body: some View {
        VStack(alignment: .leading) {
            CategoryBadge(category: video.category)
                    .padding(.bottom, 8)
            
            AsyncImage(url: URL(string: getYoutubeImageURL(from: video.url))) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
            } placeholder: {
                Color.gray
            }
            .frame(maxWidth: .infinity, minHeight: 180, maxHeight: 180, alignment: .center)
            .cornerRadius(15)
        }
    }
}

extension VideoItemList {
    func getYoutubeImageURL(from videoId: String) -> String {
        return "https://img.youtube.com/vi/\(videoId)/hqdefault.jpg"
    }
}

struct VideoItemList_Previews: PreviewProvider {
    static var previews: some View {
        VideoItemList(video: Video.preview)
    }
}
