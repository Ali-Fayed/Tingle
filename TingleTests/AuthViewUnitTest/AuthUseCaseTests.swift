//
//  AuthUseCaseTests.swift
//  TingleTests
//
//  Created by Ali Fayed on 22/09/2023.
//
import Foundation
import XCTest
import Combine
@testable import Tingle
class AuthViewUseCaseTests: XCTestCase {
    private var subscriptionsBag = Set< AnyCancellable>()
    /// Sut = System Under Test
    var sut: AuthUseCase!
    /// Mock = Fake injection
    var mocks: AuthViewMocks!
    override func setUp() {
        super.setUp()
        mocks = AuthViewMocks()
        sut = AuthUseCase(repository: mocks)
    }
    override func tearDown() {
        mocks = nil
        sut = nil
        super.tearDown()
    }
    func testFetchCurrencySymbols() {
        // Given
        _ = mocks.authenticateUser(userName: PostsListConstants.staticPostUserName, password: PostsListConstants.staticPostUserName)
        let promise = XCTestExpectation(description: "data is fetched")
        // When
        sut.excute(userName: PostsListConstants.staticPostUserName, password: PostsListConstants.staticPostUserName).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(_):
                break
            }
        } receiveValue: { authModel in
            XCTAssertNotNil(authModel.token)
            XCTAssertNotNil(authModel.username)
            XCTAssertNotNil(authModel.email)
            promise.fulfill()
        }.store(in: &subscriptionsBag)
    }
}
