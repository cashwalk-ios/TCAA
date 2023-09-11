//
//  ProfileListFeature.swift
//  TCAA
//
//  Created by 김수완 on 2023/09/04.
//

import Foundation

import ComposableArchitecture

import Moya

struct ProfileListFeature: Reducer {
    
    private let provider = MoyaProvider<RandomUserAPI>()
    
    struct State: Equatable {
        var maleList = [ProfileModel]()
        var femaleList = [ProfileModel]()
        var maleListNextPage = 0
        var femaleListNextPage = 0
        var maleListPageMax: Int?
        var femaleListPageMax: Int?
        
        var showOptionSelection: ShowOption = .wideCell
        
        var path = StackState<ProfileDetailFeature.State>()
    }
    
    enum Action: Equatable {
        case viewDidLoad
        case selectShowOption(ShowOption)
        case onMaleDataCellAppear(ProfileModel)
        case onFemaleDataCellAppear(ProfileModel)
        case deleteDataCell(ProfileModel)
        case refreshMaleList
        case refreshFemaleList
        case path(StackAction<ProfileDetailFeature.State, ProfileDetailFeature.Action>)
        
        case maleResponse([ProfileModel])
        case femaleResponse([ProfileModel])
        case moreMaleResponse([ProfileModel])
        case moreFemaleResponse([ProfileModel])
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewDidLoad:
                return .run { send in
                    let maleList = try? await self.fetchMaleProfileList(page: 0)
                    let femaleList = try? await self.fetchFemaleProfileList(page: 0)
                    await send(.maleResponse(maleList ?? []))
                    await send(.femaleResponse(femaleList ?? []))
                }
            case .selectShowOption(let showOption):
                state.showOptionSelection = showOption
                return .none
            case .maleResponse(let maleList):
                state.maleList = maleList
                state.maleListNextPage += 1
                return .none
            case .femaleResponse(let femaleList):
                state.femaleList = femaleList
                state.femaleListNextPage += 1
                return .none
            case .path:
                return .none
            case .onMaleDataCellAppear(let data):
                if data.id.uuidString == state.maleList.last?.id.uuidString {
                    // 마지막 셀이 onAppear 되었을때 - 남자 데이터 더 불러오기
                    if let maxPage = state.maleListPageMax,
                       state.maleListNextPage > maxPage {
                        // 로드할 페이지가 페이지 최대값보다 크면 로드 안함
                        return .none
                    }
                    let nextPage = state.maleListNextPage
                    return .run { send in
                        let maleList = try? await self.fetchMaleProfileList(page: nextPage)
                        await send(.moreMaleResponse(maleList ?? []))
                    }
                } else {
                    return .none
                }
            case .onFemaleDataCellAppear(let data):
                if data.id.uuidString == state.femaleList.last?.id.uuidString {
                    // 마지막 셀이 onAppear 되었을때 - 여자 데이터 더 불러오기
                    if let maxPage = state.femaleListPageMax,
                       state.femaleListNextPage > maxPage {
                        // 로드할 페이지가 페이지 최대값보다 크면 로드 안함
                        return .none
                    }
                    let nextPage = state.femaleListNextPage
                    return .run { send in
                        let femaleList = try? await self.fetchFemaleProfileList(page: nextPage)
                        await send(.moreFemaleResponse(femaleList ?? []))
                    }
                } else {
                    return .none
                }
            case .moreMaleResponse(let moreMaleList):
                state.maleList += moreMaleList
                state.maleListNextPage += 1
                if moreMaleList.count < 14 {
                    // 로드된 페이지의 데이터가 지정한 개수(14)개 이하일 시 최대 페이지 설정
                    state.maleListPageMax = state.maleListNextPage
                }
                return .none
            case .moreFemaleResponse(let moreFemaleList):
                state.femaleList += moreFemaleList
                state.femaleListNextPage += 1
                if moreFemaleList.count < 14 {
                    // 로드된 페이지의 데이터가 지정한 개수(14)개 이하일 시 최대 페이지 설정
                    state.femaleListPageMax = state.femaleListNextPage
                }
                return .none
            case .deleteDataCell(let data):
                state.maleList.removeAll(where: { $0 == data })
                state.femaleList.removeAll(where: { $0 == data })
                return .none
            case .refreshMaleList:
                state.maleListNextPage = 0
                return .run { send in
                    let maleList = try? await self.fetchMaleProfileList(page: 0)
                    await send(.maleResponse(maleList ?? []))
                }
            case .refreshFemaleList:
                state.femaleListNextPage = 0
                return .run { send in
                    let femaleList = try? await self.fetchFemaleProfileList(page: 0)
                    await send(.femaleResponse(femaleList ?? []))
                }
            }
        }
        .forEach(\.path, action: /Action.path) {
            ProfileDetailFeature()
        }
    }
}

extension ProfileListFeature {

    private func fetchMaleProfileList(page: Int) async throws -> [ProfileModel] {
        let response: RandomUserResponse = try await self.provider.async.request(.getMaleList(page: page))
        print("fetchMaleProfileList(\(page))", response.results.count)
        return response.asModel()
    }
    
    private func fetchFemaleProfileList(page: Int) async throws -> [ProfileModel] {
        let response: RandomUserResponse = try await self.provider.async.request(.getFemaleList(page: page))
        print("fetchFemaleProfileList(\(page))", response.results.count)
        return response.asModel()
    }

}
