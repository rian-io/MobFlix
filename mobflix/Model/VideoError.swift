//
//  VideoError.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import Foundation

enum VideoError: Error {
    case missingData
    case networkError
}

extension VideoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discar a video missing information", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching videos data over the network.", comment: "")
        }
    }
}
