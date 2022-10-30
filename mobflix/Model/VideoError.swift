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
    case unexpectedError(error: Error)
}

extension VideoError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discar a video missing information", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching videos data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}
