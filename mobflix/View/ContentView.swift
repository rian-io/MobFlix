//
//  ContentView.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                VideoFeatured()
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                CategoryList()
                    .listRowSeparator(.hidden)
                    .padding(.vertical, 28)
                
                // Videos List
                
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
