//
//  VideoEdit.swift
//  mobflix
//
//  Created by Rian de Oliveira on 30/10/22.
//

import SwiftUI

struct VideoEdit: View {
    @EnvironmentObject var provider: VideosProvider
    
    @Binding var video: Video
    
    @Binding var isPresentingVideoSheet: Bool
    
    var body: some View {
        Form {
            Section() {
                TextField("URL", text: $video.url)
                
                Picker("Categoria", selection: $video.category) {
                    ForEach(Category.allCases) { category in
                        Text(category.name)
                            .tag(category)
                    }
                }
            }
            
            Section(header: Text("Preview")) {
                // Create new component with separete video and category
                VideoItemPreview(videoId: video.url, category: video.category)
            }
            .padding(.top, 5)
            .padding(.bottom, 5)
            
            if !video.id.isEmpty {
                Button {
                    isPresentingVideoSheet = false
                    provider.remove(video: video)
                    video = Video()
                } label: {
                    Text("Remover")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct VideoEdit_Previews: PreviewProvider {
    static var previews: some View {
        VideoEdit(video: .constant(Video.preview), isPresentingVideoSheet: .constant(true))
            .environmentObject(
                VideosProvider(client:
                                VideoClient(downloader:
                                                TestDownloader())))
    }
}
