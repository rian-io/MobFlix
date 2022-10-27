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
    var description: String
    var url: URL
}

extension Video: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "titulo"
        case description = "descricao"
        case url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? values.decode(String.self, forKey: .id)
        let rawTitle = try? values.decode(String.self, forKey: .title)
        let rawDescription = try? values.decode(String.self, forKey: .description)
        let rawUrl = try? values.decode(String.self, forKey: .url)
        
        guard let id = rawId,
              let title = rawTitle,
              let Description = rawDescription,
              let url = rawUrl
        else {
            throw VideoError.missingData
        }
        
        self.id = id
        self.title = title
        self.description = Description
        self.url = URL(string: url)!
    }
}
