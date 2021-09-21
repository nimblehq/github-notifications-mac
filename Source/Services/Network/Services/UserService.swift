//
//  UserService.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/10/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Combine

// sourcery: AutoMockable
protocol UserServiceProtocol {

    func getUser() -> AnyPublisher<APIUser, Error>
}

final class UserService: UserServiceProtocol {

    private let networkAPI: API

    init(networkAPI: API) {
        self.networkAPI = networkAPI
    }

    func getUser() -> AnyPublisher<APIUser, Error> {
        networkAPI.performRequest(
            with: UserRequestConfiguration.user
        )
    }
}
