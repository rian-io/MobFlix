//
//  VideoByCategory.swift
//  mobflix
//
//  Created by Rian de Oliveira on 30/10/22.
//

import SwiftUI

struct VideoByCategory: View {
    @EnvironmentObject var provider: VideosProvider
    
    var filter: String
    
    var body: some View {
        List {
            HStack {
                Text("Categoria: ")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                CategoryBadge(category: Category(rawValue: filter)!)
            }
            .padding(.top, 32)
            .padding(.bottom, 25)
            .listRowSeparator(.hidden)
            
            ForEach(filteredVideos) { video in
                VideoItemList(video: video)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("MOBFLIX")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.primary.colour)
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
}

extension VideoByCategory {
    var filteredVideos: [Video] {
        if (!filter.isEmpty) {
            return provider.videos.filter { video in
                (filter == video.category.rawValue)
            }
        }
        
        return provider.videos
    }
}

struct VideoByCategory_Previews: PreviewProvider {
    static var previews: some View {
        VideoByCategory(filter: "programming")
            .environmentObject(
                VideosProvider(client:
                              VideoClient(downloader: TestDownloader())))
    }
}
