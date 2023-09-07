//
//  User.swift
//  TCAA
//
//  Created by Rocky on 2023/09/06.
//

import Foundation

enum Gender: String {
    case male
    case female
    
    var title: String {
        switch self {
        case .male: return "남자"
        case .female: return "여자"
        }
    }
}
