//
//  ProfileFeature.swift
//  TCAA
//
//  Created by Rocky on 2023/09/06.
//

import Foundation
import ComposableArchitecture

struct ProfileFeature: Reducer {
    
    // TCA Binding 기능 사용
    // 1) State에 Binding이 필요한 값을 BindingState property wrapper로 선언
    // 2) Action에 BindableAction 프로토콜을 채택하고, binding case 추가
    // 3) Reducer의 body에 BindingReducer 추가
    
    struct State: Equatable {
        @BindingState var gender: Gender = .male
        
    }
    
    enum Action: BindableAction, Equatable {    // (2) BindableAction 프로토콜 채택
        case binding(BindingAction<State>)      // (2) binding case 추가
        case maleTapped
        case femaleTapped
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()    // (3) BindingReducer 추가
        
        Reduce { state, action in
            switch action {
            // MARK: -  binding Action
            case .binding:
                return .none
                
            // MARK: - feature logic
            case .maleTapped:
                state.gender = .male
                return .none
            case .femaleTapped:
                state.gender = .female
                return .none
            }
        }
    }
}
