//
//  NetworkServiceFactory.swift
//  Nimblehq
//
//  Created by Bliss on 07/09/2020.
//  Copyright © 2020 nimble. All rights reserved.
//

import Foundation

final class NetworkServiceFactory {
    
    static let shared = NetworkServiceFactory()

    var api: API!
    
    func setUp(baseURL: String) {
        let api = GithubAPI(baseURL: baseURL, parser: DecoderFactory.defaultJsonDecoder())
        self.api = api
    }

    func createNotificationService() -> NotificationsServiceProtocol {
        NotificationsService(networkAPI: api)
    }

    func createUserService() -> UserServiceProtocol {
        UserService(networkAPI: api)
    }

    func createRepositoryService() -> RepositoryServiceProtocol {
        RepositoryService(networkAPI: api)
    }
}
