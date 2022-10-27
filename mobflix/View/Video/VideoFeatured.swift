//
//  VideoFeatured.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct VideoFeatured: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            Button (action: {
                print("Assitir destaque")
            }) {
                Text("Assistir agora")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Theme.primary.colour)
                    .cornerRadius(10)
                    .offset(y: 40)
            }
            
        }
    }
}

struct VideoFeatured_Previews: PreviewProvider {
    static var previews: some View {
        VideoFeatured()
    }
}
