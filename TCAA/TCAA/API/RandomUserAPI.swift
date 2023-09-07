//
//  RandomUserAPI.swift
//  TCAA
//
//  Created by Rocky on 2023/09/06.
//

import Foundation
import Moya
import CombineMoya

enum RandomUserAPI {
    case male(Int)
    case female(Int)
}

extension RandomUserAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://randomuser.me/api/")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        var params: [String: Any] = [:]
        switch self {
        case .male(let page):
            params.updateValue(<#T##value: Any##Any#>, forKey: <#T##String#>)
        case .female(let page):
            
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}
