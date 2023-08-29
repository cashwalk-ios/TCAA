//
//  ProfileCellView.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/22.
//

import SwiftUI

struct ProfileCellView: View {

    var profile: ProfileModel
    
    var body: some View {
        HStack {
            CacheAsyncImage(url: profile.picture) { image in
                image.image?.resizable()
            }
            .scaledToFill()
            .frame(width: 70, height: 70)
            .clipped()
            VStack(alignment: .leading) {
                Text(profile.name)
                    .font(.system(size: 20, weight: .bold))
                Text(profile.location)
                Text(profile.email)
            }
            Spacer()
        }
    }

}

struct ProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCellView(profile: ProfileModel(
            gender: .man,
            name: "qwer",
            email: "1",
            picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
            location: "qwer"
        ))
    }
}
