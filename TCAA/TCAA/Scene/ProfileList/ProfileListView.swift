//
//  ContentView.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/22.
//

import SwiftUI

struct ProfileListView: View {
    
    @State private var tabSelection = 0
    @State private var showOptionSelection: ShowOption = .wideCell
    
    var body: some View {
        VStack {
            Picker("Choose a Side", selection: $tabSelection) {
                Text("Man").tag(0)
                Text("Woman").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            HStack {
                Spacer()
                Menu("보기옵션: \(showOptionSelection == .wideCell ? "1": "2")열") {
                    Button("1열", action: { showOptionSelection = .wideCell })
                    Button("2열", action: { showOptionSelection = .halfCell })
                }
            }
            .padding(.horizontal)
            GeometryReader { proxy in
                TabView(selection: $tabSelection) {
                    CollectionView(showOptionSelection: $showOptionSelection, profileData: MockData.items)
                        .frame(width: proxy.size.width)
                        .tag(0)
                    CollectionView(showOptionSelection: $showOptionSelection, profileData: MockData.items1)
                        .frame(width: proxy.size.width)
                        .tag(1)
                }
                .onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
    }
    
    
}

struct CollectionView: View {
    
    @Binding var showOptionSelection: ShowOption
    @State var profileData: [ProfileModel]
    
    
    let columns = [GridItem(.flexible())]
    let columns1 = [GridItem(spacing: 1), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: showOptionSelection == .wideCell ? columns: columns1, spacing: 1) {
                ForEach(profileData, id: \.id) { value in
                    NavigationLink(destination: {
                        ProfileDetailView(profile: value)
                    }, label: {
                        if showOptionSelection == .wideCell {
                            ProfileCellView(profile: value)
                        } else {
                            HalfProfileCellView(profile: value)
                        }
                    })
                    .tint(Color(uiColor: .label))
                    .contextMenu {
                        Button(role: .destructive) {
                            // 셀 제거 구현
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileListView()
        }
    }
}
