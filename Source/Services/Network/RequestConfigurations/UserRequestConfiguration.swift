//
//  UserRequestConfiguration.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/10/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Alamofire

enum UserRequestConfiguration {

    case user(token: String)
}

extension UserRequestConfiguration: RequestConfiguration {

    var baseURL: String {
        Constants.Network.baseURLPath
    }

    var endpoint: String {
        return "user"
    }

    var method: HTTPMethod {
        return .get
    }

    var parameters: Parameters? {
        return nil
    }

    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var headers: HTTPHeaders? {
        switch self {
        case .user(let token):
            return ["Authorization": "token \(token)"]
        }
    }

    var interceptor: RequestInterceptor? { nil }
}
