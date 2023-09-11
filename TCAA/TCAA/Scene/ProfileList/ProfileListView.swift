//
//  ContentView.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/22.
//

import SwiftUI

import ComposableArchitecture

struct ProfileListView: View {
    
    let store: StoreOf<ProfileListFeature>
    
    @State private var tabSelection = 0
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                VStack {
                    Picker("Choose a Side", selection: $tabSelection) {
                        Text("Man").tag(0)
                        Text("Woman").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    HStack {
                        Spacer()
                        Menu("보기옵션: \(viewStore.showOptionSelection == .wideCell ? "1": "2")열") {
                            Button("1열", action: { viewStore.send(.selectShowOption(.wideCell)) })
                            Button("2열", action: { viewStore.send(.selectShowOption(.halfCell)) })
                        }
                    }
                    .padding(.horizontal)
                    GeometryReader { proxy in
                        TabView(selection: $tabSelection) {
                            CollectionView(store: store, segmentPage: .male)
                                .frame(width: proxy.size.width)
                                .tag(0)
                            CollectionView(store: store, segmentPage: .female)
                                .frame(width: proxy.size.width)
                                .tag(1)
                        }
                        .onAppear { UIScrollView.appearance().isPagingEnabled = true }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
                .onLoad() { viewStore.send(.viewDidLoad) }
                .navigationBarHidden(true)
            }
        } destination: { store in
            ProfileDetailView(store: store)
        }
    }
    
    
}

struct CollectionView: View {
    
    let store: StoreOf<ProfileListFeature>
    @State var segmentPage: SegmentPage
    
    let columns = [GridItem(.flexible())]
    let columns1 = [GridItem(spacing: 1), GridItem(.flexible())]
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                LazyVGrid(columns: viewStore.showOptionSelection == .wideCell ? columns: columns1, spacing: 1) {
                    ForEach(segmentPage == .male ? viewStore.maleList : viewStore.femaleList, id: \.id) { value in
                        NavigationLink(state: ProfileDetailFeature.State(profile: value), label: {
                            if viewStore.showOptionSelection == .wideCell {
                                ProfileCellView(profile: value)
                            } else {
                                HalfProfileCellView(profile: value)
                            }
                        })
                        .tint(Color(uiColor: .label))
                        .contextMenu {
                            Button(role: .destructive) {
                                viewStore.send(.deleteDataCell(value))
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .onAppear {
                            viewStore.send(
                                segmentPage == .male ? .onMaleDataCellAppear(value): .onFemaleDataCellAppear(value)
                            )
                        }
                    }
                }
                .padding(.horizontal)
            }
            .refreshable {
                viewStore.send(
                    segmentPage == .male ? .refreshMaleList: .refreshFemaleList
                )
            }
        }
    }
}
