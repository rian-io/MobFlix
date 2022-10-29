//
//  CategoryBadge.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

struct CategoryBadge: View {
    var category: Category
    
    var body: some View {
        Text(category.name)
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .frame(height: 32.0)
            .background(category.colour)
            .cornerRadius(10)
    }
}

struct CategoryBadge_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBadge(category: Category.frontend)
    }
}
