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

    init(networkAPI: API) {
        self.networkAPI = networkAPI
    }

    func getRepositories() -> AnyPublisher<[Repository], Error> {
        networkAPI.performRequest(
            with: RepositoryRequestConfiguration.getRepositories
        )
    }
}
