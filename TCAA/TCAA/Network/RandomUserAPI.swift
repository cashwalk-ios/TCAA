//
//  RandomUserAPI.swift
//  TCAA
//
//  Created by 김수완 on 2023/09/04.
//

import Foundation
import Moya

enum RandomUserAPI {
    case getMaleList(count: Int, page: Int)
    case getFemaleList(count: Int, page: Int)
}

extension RandomUserAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://randomuser.me/api")!
    }
    
    var path: String {
        switch self {
        default:
            return "/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMaleList(let count, let page):
            return .requestParameters(
                parameters: [
                    "inc": "gender,name,email,picture,location",
                    "results" : count,
                    "gender": "male",
                    "page": page],
                encoding: URLEncoding.default
            )
        case .getFemaleList(let count, let page):
            return .requestParameters(
                parameters: [
                    "inc": "gender,name,email,picture,location",
                    "results" : count,
                    "gender":"female",
                    "page": page],
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
