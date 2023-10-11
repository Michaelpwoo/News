//
//  MockNewsArticleRepository.swift
//  News
//
//  Created by Michael Woo on 10/4/23.
//

import Foundation
import Combine
import Alamofire

class MockNewsArticleRepository: NewsArticleRepository {
    func getNewsArticle(pageId: String?) -> AnyPublisher<ArticleList, Alamofire.AFError> {
      return Future<ArticleList, AFError> { promise in
            promise(.success(DevelopmentProvider.shared.articleList))
        }.eraseToAnyPublisher()
    }
}
