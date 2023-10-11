//
//  CacheImageView.swift
//  News
//
//  Created by Michael Woo on 10/5/23.
//

import SwiftUI
import Kingfisher

struct CacheImageView: View {
    let urlString: String
    
    var body: some View {
        GeometryReader { geo in
            KFImage(URL(string: urlString)!)
                .placeholder { _ in
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .controlSize(.large)
                }
                .cacheMemoryOnly()
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }

}

struct CacheImageView_Previews: PreviewProvider {
    static var previews: some View {
        CacheImageView(urlString: "https://sportshub.cbsistatic.com/i/2023/10/04/9d6bbc10-9899-4111-b435-e73e3cadfb76/american-horror-story-delicate-ep-3-recap.jpg")
    }
}
