//
//  Video.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import Foundation

struct Video: Identifiable {
    var id: String
    var title: String
    var category: Category
    var url: String
}

extension Video: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "titulo"
        case category = "categoria"
        case url
    }
    
    init() {
        self.id = ""
        self.title = ""
        self.category = Category.programming
        self.url = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? values.decode(String.self, forKey: .id)
        let rawTitle = try? values.decode(String.self, forKey: .title)
        let rawCategory = try? values.decode(String.self, forKey: .category)
        let rawUrl = try? values.decode(String.self, forKey: .url)
        
        guard let id = rawId,
              let title = rawTitle,
              let category = rawCategory,
              let url = rawUrl
        else {
            throw VideoError.missingData
        }
        
        self.id = id
        self.title = title
        self.category = Category.init(rawValue: category)!
        self.url = url
    }
}
