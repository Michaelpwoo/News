//
//  DetailArticleView.swift
//  News
//
//  Created by Michael Woo on 10/3/23.
//

import SwiftUI

struct DetailArticleView: View {
    let newsArticle: NewsArticle
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                let minY = proxy.frame(in: .global).minY
                let isScrollingUp = minY < 0
                CacheImageView(urlString: newsArticle.imageURL)
                    .frame(
                        width: proxy.size.width, height: proxy.size.height + max(minY,0) + 25
                    )
                    .offset(y: isScrollingUp ? -minY * 0.7 : -minY)
            }
            .frame(height: 350)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(newsArticle.category[0])
                        .fontWeight(.heavy)
                        .textCase(.uppercase)
                    Spacer()
                }
                Text(newsArticle.pubDate.toDateTime()).foregroundColor(.gray)
                Text(newsArticle.title).font(.title).fontWeight(.bold)
                if let creator = newsArticle.creator?.first {
                    Text("by: \(creator)" )
                        .font(.callout).foregroundColor(.gray)
                }
                Text(newsArticle.content)
            }
            .frame(maxWidth: .infinity)
            .padding(.all, 30)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .ignoresSafeArea()
    

    }
}

struct DetailArticleView_Previews: PreviewProvider {
    static var previews: some View {
        DetailArticleView(newsArticle:development.articleList.results[0])
    }
}
