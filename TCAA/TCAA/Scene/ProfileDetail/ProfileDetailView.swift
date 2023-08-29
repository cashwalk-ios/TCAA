//
//  ProfileDetail.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/23.
//

import SwiftUI

struct ProfileDetailView: View {
    
    var profile: ProfileModel

    var body: some View {
        GeometryReader { proxy in
            AsyncImage(url: profile.picture) { image in
                image.image?.resizable()
            }
            .scaledToFit()
            .modifier(ImageModifier(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height)))
        }
        .navigationTitle("Deatil")
    }

}
