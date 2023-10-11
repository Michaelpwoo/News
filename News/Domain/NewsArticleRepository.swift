//
//  NewsArticleRepository.swift
//  News
//
//  Created by Michael Woo on 10/4/23.
//

import Foundation
import Combine
import Alamofire

protocol NewsArticleRepository {
    func getNewsArticle(pageId: String?) -> AnyPublisher<ArticleList, AFError>
}

class NewsArticleRepositoryImpl: NewsArticleRepository {
    
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getNewsArticle(pageId: String?) -> AnyPublisher<ArticleList, Alamofire.AFError> {
        return networkEngine.request(NewsArticleRouter.getNewsArticles(pageId: pageId)).eraseToAnyPublisher()
    }
}
