//
//  ContentView.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var provider: VideosProvider
    
    @State var isLoading = false
    @State private var error: VideoError?
    @State private var hasError = false
    
    @State private var filter: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    VideoFeatured(video: provider.featuredVideo)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    
                    CategoryList(filter: $filter)
                        .listRowSeparator(.hidden)
                        .padding(.vertical, 28)
                    
                    ForEach(filteredVideos) { video in
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
                .refreshable {
                    await fetchVideos()
                }
                
                FloatingButton()
            }
        }
        .task {
           await fetchVideos()
        }
    }
}

extension Home {
    var filteredVideos: [Video] {
        if (!filter.isEmpty) {
            return provider.videos.filter { video in
                (filter == video.category.rawValue)
            }
        }
        
        return provider.videos
    }
    
    func fetchVideos() async {
        isLoading = false
        do {
            try await provider.fetchVideos()
        } catch {
            self.error = error as? VideoError ?? .unexpectedError(error: error)
            self.hasError = true
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
        Home()
            .environmentObject(
                VideosProvider(client:
                              VideoClient(downloader: TestDownloader())))
    }
}
