//
//  Theme.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

enum Theme: String {
    case primary
    case secondary
    
    var colour: Color {
        Color(rawValue)
    }
}
