//
//  NotificationRequestConfiguration.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Alamofire

enum NotificationRequestConfiguration {

    case notifications
}

extension NotificationRequestConfiguration: RequestConfiguration {

    var baseURL: String {
        Constants.Network.baseURLPath
    }

    var endpoint: String {
        switch self {
        case .notifications: return "notifications"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .notifications: return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .notifications: return nil
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .notifications: return JSONEncoding.default
        }
    }

    var headers: HTTPHeaders? {
        return ["If-None-Match": "-"]
    }

    var interceptor: RequestInterceptor? {
        AuthenticatedInterceptor(keychain: Keychain.default)
    }
}
