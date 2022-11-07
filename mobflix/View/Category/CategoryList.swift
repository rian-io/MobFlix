//
//  CategoryList.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct CategoryList: View {
    @State var filter: String = ""
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 18) {
                ForEach(Category.allCases) { category in
                    NavigationLink(destination: VideoByCategory(filter: category.id)) {
                            CategoryBadge(category: category)
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
