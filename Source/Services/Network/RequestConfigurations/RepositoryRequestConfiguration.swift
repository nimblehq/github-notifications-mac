//
//  RepositoryRequestConfiguration.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 20/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Alamofire

enum RepositoryRequestConfiguration {

    case getRepositories
}

extension RepositoryRequestConfiguration: RequestConfiguration {

    var baseURL: String { Constants.Network.baseURLPath }

    var endpoint: String {
        switch self {
        case .getRepositories: return "user/subscriptions"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getRepositories: return .get
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .getRepositories: return URLEncoding.default
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getRepositories: return ["per_page": 100]
        }
    }

    var interceptor: RequestInterceptor? {
        AuthenticatedInterceptor(keychain: Keychain.default)
    }
}
