//
//  ProfileDetailFeture.swift
//  TCAA
//
//  Created by 김수완 on 2023/09/04.
//

import Foundation

import ComposableArchitecture

struct ProfileDetailFeature: Reducer {
    
    struct State: Equatable {
        let profile: ProfileModel
    }
    
    enum Action: Equatable {
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            }
        }
    }

}
