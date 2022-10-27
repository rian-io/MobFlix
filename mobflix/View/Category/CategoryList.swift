//
//  CategoryList.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct CategoryList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 18) {
                ForEach(Category.allCases) { category in
                    Button(action: {
                        print("Filtrar Categorias")
                    }, label: {
                        CategoryBadge(category: category)
                    })
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
