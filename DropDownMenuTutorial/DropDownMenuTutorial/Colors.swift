//
//  Colors.swift
//  DropDownMenuTutorial
//
//  Created by Paolo Prodossimo Lopes on 22/09/21.
//

import UIKit

enum Colors: Int, CaseIterable {
    case purple
    case pink
    case teal
    
    var colorName: String {
        switch self {
        case .purple: return "Pourple"
        case .pink: return "Pink"
        case .teal: return "Teal"
        }
    }
    
    var color: UIColor {
        switch self {
        case .purple: return UIColor.systemPurple
        case .pink: return UIColor.systemPink
        case .teal: return UIColor.systemTeal
        }
    }
}
