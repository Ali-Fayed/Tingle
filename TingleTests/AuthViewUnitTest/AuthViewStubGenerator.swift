//
//  AuthViewStubGenerator.swift
//  TingleTests
//
//  Created by Ali Fayed on 22/09/2023.
//
import Combine
import XCTest
@testable import Tingle
class AuthViewStubGenerator {
    func stubAuth() -> AnyPublisher<LoginEntity, APIError> {
        guard let path = Bundle.authUnitTest.path(forResource: "authResponse", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            // Return a publisher that fails with an APIError if the data loading fails
            return Fail(error: APIError(.general)).eraseToAnyPublisher()
        }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let model = try decoder.decode(LoginEntity.self, from: data)
            // Return a publisher that emits the decoded model as a value
            return Just(model).setFailureType(to: APIError.self).eraseToAnyPublisher()
        } catch {
            // Return a publisher that fails with an APIError if decoding fails
            return Fail(error: APIError(.general)).eraseToAnyPublisher()
        }
    }

}
extension Bundle {
    public class var authUnitTest: Bundle {
        return Bundle(for: LoginUseCase.self)
    }
}
