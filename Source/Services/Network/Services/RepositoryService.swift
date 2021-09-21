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
        networkAPI.performRequest(
            with: RepositoryRequestConfiguration.getRepositories(userSession.username ?? "")
        )
    }
}
