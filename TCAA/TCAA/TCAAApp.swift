//
//  TCAAApp.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/22.
//

import SwiftUI

import ComposableArchitecture

@main
struct TCAAApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ProfileListView(store: Store(initialState: ProfileListFeature.State()) {
                    ProfileListFeature()
                })
            }
        }
    }
}
