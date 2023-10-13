//
//  HomeViewModel.swift
//  News
//
//  Created by Michael Woo on 10/4/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var pageId: String?
    let newsArticleRepository: NewsArticleRepository
    var cancellables: Set<AnyCancellable> = []
    
    @Published var newsArticles: [NewsArticle] = []
    @Published var isLoading = false
    
    init(newsArticleRepository: NewsArticleRepository = NewsArticleRepositoryImpl()) {
        if Constant.apiKey.isEmpty {
            self.newsArticleRepository = MockNewsArticleRepository()
        } else {
            self.newsArticleRepository = newsArticleRepository
        }
    }
    
    func shouldLoadMoreNewsArticles(newsArticle: NewsArticle) {
        let tresholdIndex = newsArticles.index(newsArticles.endIndex, offsetBy: -2)
        if newsArticles.firstIndex(where: {$0.articleID == newsArticle.articleID}) == tresholdIndex {
            getArticles()
        }
    }
    
    func getArticles() {
        guard !isLoading else {
            return
        }
        isLoading = true
        newsArticleRepository
            .getNewsArticle(pageId: pageId)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput:{ [weak self] response in
                self?.pageId = response.nextPage
                self?.isLoading = false
            })
            .map({ [weak self] response in
                guard let self = self else {
                    return []
                }
                return self.newsArticles + response.results
            })
            .catch({[weak self] error in
                return Just(self?.newsArticles ?? [])
            })
            .assign(to: &$newsArticles)

    }
}
