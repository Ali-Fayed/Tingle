//
//  PostUseCaseTests.swift
//  TingleTests
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
import XCTest
import Combine
@testable import Tingle
class PostUseCaseTests: XCTestCase {
    private var subscriptionsBag = Set< AnyCancellable>()
    /// Sut = System Under Test
    var sut: PostsViewUseCase!
    /// Mock = Fake injection
    var mocks: PostViewMocks!
    override func setUp() {
        super.setUp()
        mocks = PostViewMocks()
        sut = PostsViewUseCase(repository: mocks)
    }
    override func tearDown() {
        mocks = nil
        sut = nil
        super.tearDown()
    }
    func testFetchCurrencySymbols() {
        // Given
        _ = mocks.fetchPosts()
        let promise = XCTestExpectation(description: "data is fetched")
        // When
        sut.excute().sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(_):
                break
            }
        } receiveValue: { post in
            XCTAssertNotNil(post)
            promise.fulfill()
        }.store(in: &subscriptionsBag)
    }
}
