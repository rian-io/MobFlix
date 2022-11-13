//
//  ContentView.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var provider: VideosProvider
    
    @State var isPresentingVideoSheet = false;
    
    @State var videoData = Video()
    
    var body: some View {
        NavigationView {
            List {
                VideoFeatured(video: provider.featuredVideo)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                CategoryList()
                    .listRowSeparator(.hidden)
                    .padding(.vertical, 28)
                
                ForEach(provider.videos) { video in
                    VideoItemList(video: video, isPresentingVideoSheet: $isPresentingVideoSheet, selectedVideo: $videoData)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("MOBFLIX")
                        .font(.custom("BebasNeue-Regular", size: 32))
                        .foregroundColor(Theme.primary.colour)
                        .accessibilityAddTraits(.isHeader)
                }
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        isPresentingVideoSheet = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $isPresentingVideoSheet) {
                NavigationView {
                    VideoEdit(video: $videoData, isPresentingVideoSheet: $isPresentingVideoSheet)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancelar") {
                                    isPresentingVideoSheet = false
                                    videoData = Video()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Salvar") {
                                    isPresentingVideoSheet = false
                                    
                                    let newVideo = videoData
                                    
                                    if (newVideo.id.isEmpty) {
                                        provider.videos.append(newVideo)
                                    } else {
                                        provider.update(video: newVideo)
                                    }
                                    
                                    videoData = Video()
                                }
                            }
                        }
                }
            }
            .refreshable {
                do {
                    try await provider.fetchVideos()
                } catch { }
            }
        }
        .task {
            do {
                try await provider.fetchVideos()
            } catch { }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(
                VideosProvider(client:
                                VideoClient(downloader:
                                                TestDownloader())))
    }
}
