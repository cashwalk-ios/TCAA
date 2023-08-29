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
            CacheAsyncImage(url: profile.picture!) { image in
                image.image?
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            }
            Text(profile.name)
                .font(.system(size: 20, weight: .bold))
            Text(profile.location)
            Text(profile.email)
        }
    }

}

struct HalfProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        HalfProfileCellView(profile: ProfileModel(
            gender: .man,
            name: "qwer",
            email: "1",
            picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
            location: "qwer"
        ))
    }
}

struct CacheAsyncImage<Content>: View where Content: View{
    
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        url: URL,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ){
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View{
        if let cached = ImageCache[url]{
            let _ = print("cached: \(url.absoluteString)")
            content(.success(cached))
        }else{
            let _ = print("request: \(url.absoluteString)")
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ){phase in
                cacheAndRender(phase: phase)
            }
        }
    }
    func cacheAndRender(phase: AsyncImagePhase) -> some View{
        if case .success (let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}
fileprivate class ImageCache{
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image?{
        get{
            ImageCache.cache[url]
        }
        set{
            ImageCache.cache[url] = newValue
        }
    }
}
