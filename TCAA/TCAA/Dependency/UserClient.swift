//
//  UserClient.swift
//  TCAA
//
//  Created by 김수완 on 2023/09/11.
//

import Foundation

import Moya
import ComposableArchitecture

struct UserClient {
    var responseListCount: Int
    var fetchMaleList: (_ page: Int) async throws -> [ProfileModel]
    var fetchFemaleList: (_ page: Int) async throws -> [ProfileModel]
}

extension UserClient: DependencyKey {
    
    private static let provider = MoyaProvider<RandomUserAPI>()
    
    private static let responseListCount = 14
    
    static var liveValue = Self(
        responseListCount: Self.responseListCount,
        fetchMaleList: { page in
            let response: RandomUserResponse = try await Self.provider.async.request(.getMaleList(
                count: Self.responseListCount,
                page: page
            ))
            print("fetchMaleProfileList(\(page))", response.results.count)
            return response.asModel()
        },
        fetchFemaleList: { page in
            let response: RandomUserResponse = try await Self.provider.async.request(.getFemaleList(
                count: Self.responseListCount,
                page: page
            ))
            print("fetchMaleProfileList(\(page))", response.results.count)
            return response.asModel()
        }
    )
}

extension DependencyValues {
    var randomUser: UserClient {
        get { self[UserClient.self] }
        set { self[UserClient.self] = newValue }
    }
}
