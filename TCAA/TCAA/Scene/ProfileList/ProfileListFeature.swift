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
    
    @Dependency(\.randomUser) var randomUser
    
    struct State: Equatable {
        @BindingState var tabSelection: SegmentPage = .male
        var maleList = [ProfileModel]()
        var femaleList = [ProfileModel]()
        var maleListNextPage = 0
        var femaleListNextPage = 0
        var maleListPageMax: Int?
        var femaleListPageMax: Int?
        
        var showOptionSelection: ShowOption = .wideCell
        
        var path = StackState<ProfileDetailFeature.State>()
    }
    
    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case viewDidLoad
        case selectShowOption(ShowOption)
        case onMaleDataCellAppear(ProfileModel)
        case onFemaleDataCellAppear(ProfileModel)
        case deleteDataCell(ProfileModel)
        case refreshMaleList
        case refreshFemaleList
        case path(StackAction<ProfileDetailFeature.State, ProfileDetailFeature.Action>)
        
        case maleListResponse(TaskResult<[ProfileModel]>)
        case femaleListResponse(TaskResult<[ProfileModel]>)
        
        case requestMaleUser(Int)
        case requestFemaleUser(Int)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .viewDidLoad:
                return .run { send in
                    await send(.requestMaleUser(0))
                    await send(.requestFemaleUser(0))
                }
            case .selectShowOption(let showOption):
                state.showOptionSelection = showOption
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
                        await send(.requestMaleUser(nextPage))
                    }
                } else {
                    return .none
                }
            case .onFemaleDataCellAppear(let data):
                if data == state.femaleList.last {
                    // 마지막 셀이 onAppear 되었을때 - 여자 데이터 더 불러오기
                    if let maxPage = state.femaleListPageMax,
                       state.femaleListNextPage > maxPage {
                        // 로드할 페이지가 페이지 최대값보다 크면 로드 안함
                        return .none
                    }
                    let nextPage = state.femaleListNextPage
                    return .run { send in
                        await send(.requestFemaleUser(nextPage))
                    }
                } else {
                    return .none
                }
            case .deleteDataCell(let data):
                state.maleList.removeAll(where: { $0 == data })
                state.femaleList.removeAll(where: { $0 == data })
                return .none
            case .refreshMaleList:
                state.maleListNextPage = 0
                return .run { send in
                    await send(.requestMaleUser(0))
                }
            case .refreshFemaleList:
                state.femaleListNextPage = 0
                return .run { send in
                    await send(.requestFemaleUser(0))
                }
            case .requestMaleUser(let page):
                return .run { send in
                    await send(.maleListResponse( TaskResult{
                        try await self.randomUser.fetchMaleList(page)
                    }))
                }
            case .requestFemaleUser(let page):
                return .run { send in
                    await send(.femaleListResponse( TaskResult{
                        try await self.randomUser.fetchFemaleList(page)
                    }))
                }
            case .maleListResponse(.success(let data)):
                if state.maleListNextPage == 0 {
                    state.maleList = data
                } else {
                    state.maleList += data
                    if data.count < randomUser.responseListCount {
                        // 로드된 페이지의 데이터가 지정한 개수 이하일 시 최대 페이지 설정
                        state.maleListPageMax = state.maleListNextPage
                    }
                }
                state.maleListNextPage += 1
                return .none
            case .femaleListResponse(.success(let data)):
                if state.femaleListNextPage == 0 {
                    state.femaleList = data
                } else {
                    state.femaleList += data
                    if data.count < randomUser.responseListCount {
                        // 로드된 페이지의 데이터가 지정한 개수 이하일 시 최대 페이지 설정
                        state.femaleListPageMax = state.femaleListNextPage
                    }
                }
                state.femaleListNextPage += 1
                return .none
            case .maleListResponse(.failure(_)):
                return .none // 에러처리
            case .femaleListResponse(.failure(_)):
                return .none // 에러처리
            case .binding(_):
                return .none
            }
            
        }
        .forEach(\.path, action: /Action.path) {
            return ProfileDetailFeature()
        }
    }
}
