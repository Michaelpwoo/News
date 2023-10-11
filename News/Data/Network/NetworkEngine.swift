//
//  NetworkEngine.swift
//  News
//
//  Created by Michael Woo on 10/4/23.
//

import Foundation
import Alamofire
import Combine

class NetworkEngine {
    let session: Session
    
    init(configuration: URLSessionConfiguration = URLSessionConfiguration.af.default) {
        configuration.httpAdditionalHeaders = ["X-ACCESS-KEY"  : Constant.apiKey]
        session = Session(configuration: configuration)

    }
    
    func request<T:Decodable>(_ urlRequest: URLRequestConvertible) async throws -> T {
        let response = await session
            .request(urlRequest)
            .validate()
            .serializingDecodable(T.self)
            .response
        
        switch response.result {
        case .success(let decodableObject):
            return decodableObject
        case .failure(let error):
            throw error
        }
    }
    
    func request<T: Decodable>(_ urlRequest: URLRequestConvertible) -> AnyPublisher<T, AFError> {
        session
            .request(urlRequest)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            
    }
}
