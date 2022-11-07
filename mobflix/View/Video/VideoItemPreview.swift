//
//  VideoItemPreview.swift
//  mobflix
//
//  Created by Rian de Oliveira on 31/10/22.
//

import SwiftUI

struct VideoItemPreview: View {
    var videoId: String
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            CategoryBadge(category: category)
                    .padding(.bottom, 8)
            
            AsyncImage(url: URL(string: getYoutubeImageURL(from: videoId))) { image in
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

extension VideoItemPreview {
    func getYoutubeImageURL(from videoUrl: String) -> String {
        return "https://img.youtube.com/vi/\(videoId)/hqdefault.jpg"
    }
}

struct VideoItemPreview_Previews: PreviewProvider {
    static var previews: some View {
        VideoItemPreview(videoId: "94yuIVdoevc", category: .frontend)
    }
}
