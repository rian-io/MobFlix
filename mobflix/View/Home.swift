//
//  ContentView.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct Home: View {
    var videoFeatured: Video
    var videos: [Video]
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    VideoFeatured(video: videoFeatured)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    
                    CategoryList()
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 20)
                    
                    // Videos List
                    ForEach(videos) { video in
                        VideoItem(video: video)
                            .modifier(CenterModifier())
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
                
                FloatingButton()
            }
        }
    }
}

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        let decoder = JSONDecoder()
        let videos: [Video] = try! decoder.decode([Video].self, from: testData)
        
        let video = videos.first!
        
        Home(videoFeatured: video, videos: videos)
    }
}
