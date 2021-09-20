//
//  RepositoryRequestConfiguration.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 20/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

enum RepositoryRequestConfiguration {

    case getRepositories(String)
}

extension RepositoryRequestConfiguration: RequestConfiguration {

    var baseURL: String { Constants.Network.baseURLPath }

    var endpoint: String {
        switch self {
        case .getRepositories(let userName): return "users/\(userName)/subscriptions"
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
}
