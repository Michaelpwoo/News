//
//  NewsArticleRouter.swift
//  News
//
//  Created by Michael Woo on 10/4/23.
//

import Foundation
import Alamofire

enum NewsArticleRouter: URLRequestConvertible {

    case getNewsArticles(pageId: String?)

    var path: String {
        switch self {
        case .getNewsArticles:
            return "news"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNewsArticles:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getNewsArticles(let pageId):
            var parameters: [String: CustomStringConvertible] = [:]
            if let pageId = pageId {
                parameters["page"] = pageId
            }
            parameters["country"] = "us"
            parameters["image"] = 1
            return parameters
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.API.baseUrl.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10*1000)
        return try URLEncoding.default.encode(request,with: parameters)
    }
}
