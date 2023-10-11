//
//  NewsArticleModel.swift
//  NewsApp
//
//  Created by Michael Woo on 10/2/23.
//

// MARK: - ArticleList
struct ArticleList: Codable {
    let status: String
    let totalResults: Int
    let results: [NewsArticle]
    let nextPage: String
}

// MARK: - NewsArticle
struct NewsArticle: Codable, Hashable {
    let articleID, title: String
    let link: String
    let keywords, creator: [String]?
    let description: String?
    let content, pubDate: String
    let imageURL: String
    let sourceID: String
    let sourcePriority: Int
    let category: [String]
    var isFavorite = false

    enum CodingKeys: String, CodingKey {
        case articleID = "article_id"
        case title, link, keywords, creator
        case description, content, pubDate
        case imageURL = "image_url"
        case sourceID = "source_id"
        case sourcePriority = "source_priority"
        case category
    }
}

