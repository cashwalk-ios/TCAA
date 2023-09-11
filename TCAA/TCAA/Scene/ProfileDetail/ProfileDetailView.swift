//
//  ProfileDetail.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/23.
//

import SwiftUI

import ComposableArchitecture

struct ProfileDetailView: View {
    
    let store: StoreOf<ProfileDetailFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { proxy in
                CacheAsyncImage(url: viewStore.profile.picture) { image in
                    image.image?.resizable()
                }
                .scaledToFit()
                .modifier(ImageModifier(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height)))
            }
        }
        .navigationTitle("Detail")
    }

}
