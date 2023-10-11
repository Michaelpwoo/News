//
//  NewsTests.swift
//  NewsTests
//
//  Created by Michael Woo on 10/2/23.
//

import XCTest
@testable import News

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel?

    override func setUpWithError() throws {
        try? super.setUpWithError()
        let mockNewsArticleRepository = MockNewsArticleRepository()
        sut = HomeViewModel(newsArticleRepository: mockNewsArticleRepository)
    }

    func testGetArticles() throws {
        XCTAssertTrue(sut?.newsArticles.count == 0)
        
        sut?.getArticles()
        
        XCTAssertTrue(sut?.newsArticles.count == 10)
        XCTAssertTrue(sut?.newsArticles[0].articleID == "711992b711b603dbbbc64b306463a615")
        XCTAssertTrue(sut?.newsArticles[0].title == "Hulu Celebrates 25 Years Of \u{2018}Felicity\u{2019}")
        XCTAssertTrue(sut?.newsArticles[1].articleID == "8980453226305605323d3eddbb5e0250")
    }
}
