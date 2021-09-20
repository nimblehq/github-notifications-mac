//
//  RepositoryService.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 20/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Combine

// sourcery: AutoMockable
protocol RepositoryServiceProtocol {

    func getRepositories() -> AnyPublisher<[Repository], Error>
}

final class RepositoryService: RepositoryServiceProtocol {

    private let networkAPI: API
    private let userSession: UserSessionStorageProtocol

    init(
        networkAPI: API,
        userSession: UserSessionStorageProtocol
    ) {
        self.networkAPI = networkAPI
        self.userSession = userSession
    }

    func getRepositories() -> AnyPublisher<[Repository], Error> {
//        networkAPI.performRequest(
//            with: RepositoryRequestConfiguration.getRepositories(userSession.username ?? "")
//        )

        Future { promise in
            if  let data = Data.jsonData,
                let result = try? JSONDecoder().decode([Repository].self, from: data) {
                promise(.success(result))
            } else {
                promise(.failure(APIError.generic))
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Dummy

import Foundation

private extension Data {

    static var jsonData: Data? {
        guard let path = Bundle.main.path(forResource: "repositories", ofType: "json"),
              let jsonData = try? String(contentsOfFile: path).data(using: .utf8)
        else { return nil }
        return jsonData
    }
}

enum APIError: Error {

    case generic
}
