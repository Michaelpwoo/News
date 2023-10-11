//
//  CardView.swift
//  News
//
//  Created by Michael Woo on 10/3/23.
//

import SwiftUI

struct CardView: View {
        
    @Binding var newsArticle: NewsArticle
    
    var body: some View {
        VStack(spacing: 0) {
            CacheImageView(urlString: newsArticle.imageURL)
                .frame(height: 300)
            VStack( alignment: .leading, spacing: 13) {
                HStack {
                    Text(newsArticle.category[0])
                        .fontWeight(.heavy)
                        .textCase(.uppercase)
                    Spacer()
                }

                Text(newsArticle.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(3)
                Text(newsArticle.content)
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.gray)
                Text(newsArticle.sourceID)
                    .font(.callout)
                    .textCase(.uppercase)
                Text(newsArticle.pubDate.toDateTime())
                    .foregroundColor(.gray)

            }
            .padding(.all, 30)
            .background(.white)

        }
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(newsArticle: .constant(development.articleList.results[1]))
    }
}
