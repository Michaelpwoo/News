//
//  PreviewProvider.swift
//  NewsApp
//
//  Created by Michael Woo on 10/2/23.
//

import SwiftUI

extension PreviewProvider {
    
    static var development: DevelopmentProvider {
        return DevelopmentProvider.shared
    }

}

class DevelopmentProvider {

    static let shared = DevelopmentProvider()
    private init() { }
    
    let articleList = loadJson(filename: "ArticleList")
    
    // MARK: - HomeView
    func createMockMainViewModel() -> HomeViewModel {
         let mockNewsArticleRepository = MockNewsArticleRepository()
         return HomeViewModel(newsArticleRepository: mockNewsArticleRepository)
    }

    static func loadJson(filename fileName: String) -> ArticleList {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ArticleList.self, from: data)
                return jsonData
            } catch {
                return ArticleList(status: "1", totalResults: 0, results: [], nextPage: "1")
            }
        }
        
        return ArticleList(status: "1", totalResults: 0, results: [], nextPage: "1")

    }
}
