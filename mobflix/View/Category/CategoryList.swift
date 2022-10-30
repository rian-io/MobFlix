//
//  CategoryList.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct CategoryList: View {
    @Binding var filter: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 18) {
                ForEach(Category.allCases) { category in
                    Button(action: {
                        if (filter.isEmpty || filter != category.id) {
                            filter = category.id
                        } else {
                            filter = ""
                        }
                    }, label: {
                        CategoryBadge(category: category)
                    })
                }
            }
            
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    @State static var filter = ""
    
    static var previews: some View {
        CategoryList(filter: $filter)
    }
}
