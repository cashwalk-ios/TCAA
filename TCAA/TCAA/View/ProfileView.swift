//
//  ProfileView.swift
//  TCAA
//
//  Created by Rocky on 2023/09/06.
//

import SwiftUI
import ComposableArchitecture

struct ProfileView: View {
    
    let store: StoreOf<ProfileFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("랜덤프로필")
                    .font(.headline)
                    .padding(.top, 3)
                TopTabBarView(selectedGender: viewStore.$gender)
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            print("보기옵션 버튼 Tapped")
                        } label: {
                            Text("보기 옵션: 1열")
                                .foregroundColor(Color.black)
                        }
                        .padding(.trailing, 15)
                    }
                    
                    GeometryReader { proxy in
                        TabView(selection: viewStore.$gender) {
                            CollectionView(viewStore: viewStore, gender: .male)
                                .frame(width: proxy.size.width, height: proxy.size.width)
                            
                            CollectionView(viewStore: viewStore, gender: .female)
                                .frame(width: proxy.size.width, height: proxy.size.width)
                        }
                        .tabViewStyle(.page)
                    }
                    
                }
            }
        }
        
    }
    
}

struct CollectionView: View {
    var viewStore: ViewStore<ProfileFeature.State, ProfileFeature.Action>
    let gender: Gender
    
    let colums = Array(repeating: GridItem(.flexible()), count: 10)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: self.colums) {
                Text("ggk")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(store: Store(initialState: ProfileFeature.State()) {
            ProfileFeature()
        })
    }
}
