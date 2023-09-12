//
//  HalfProfileCellView.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/22.
//

import SwiftUI

struct HalfProfileCellView: View {

    var profile: ProfileModel
    
    var body: some View {
        VStack {
            CacheAsyncImage(url: profile.picture) { image in
                image.image?
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            }
            Text(profile.name)
                .lineLimit(0)
                .font(.system(size: 20, weight: .bold))
            Text(profile.location)
                .lineLimit(0)
            Text(profile.email)
                .lineLimit(0)
        }
    }

}

struct HalfProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        HalfProfileCellView(profile: ProfileModel(
            gender: .male,
            name: "qwer",
            email: "1",
            picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
            location: "qwer"
        ))
    }
}
