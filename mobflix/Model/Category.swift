//
//  Category.swift
//  mobflix
//
//  Created by Rian de Oliveira on 26/10/22.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case frontend
    case programming
    case mobile
    case datascience
    case devops
    case uxdesign
    
    var id: String {
        rawValue
    }
    
    var colour: Color {
        Color(rawValue)
    }
    
    var name: String {
        switch self {
        case.datascience:
            return "Data Science"
        case.devops:
            return "DevOps"
        case.frontend:
            return "Front End"
        case.mobile:
            return "Mobile"
        case.programming:
            return "Programação"
        case.uxdesign:
            return "UX e Design"
        }
    }
}
