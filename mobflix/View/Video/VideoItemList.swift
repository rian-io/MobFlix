//
//  VideoItem.swift
//  mobflix
//
//  Created by Rian de Oliveira on 29/10/22.
//

import SwiftUI

struct VideoItemList: View {
    var video: Video
    
    @Binding var isPresentingVideoSheet: Bool
    @Binding var selectedVideo: Video
    
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
            .cornerRadius(10)
            .onTapGesture {
                UIApplication.shared.open(URL(string: getYoutubeWatchURL(from: video.url))!)
            }
            .onLongPressGesture(minimumDuration: 0.3) {
                selectedVideo = video
                isPresentingVideoSheet = true
            }
        }
    }
}

extension VideoItemList {
    func getYoutubeImageURL(from videoId: String) -> String {
        return "https://img.youtube.com/vi/\(videoId)/hqdefault.jpg"
    }
    
    func getYoutubeWatchURL(from videoId: String) -> String {
        return "https://www.youtube.com/watch?v=\(videoId)"
    }
}

struct VideoItemList_Previews: PreviewProvider {
    static var previews: some View {
        VideoItemList(video: Video.preview, isPresentingVideoSheet: .constant(false), selectedVideo: .constant(Video.preview))
    }
}
