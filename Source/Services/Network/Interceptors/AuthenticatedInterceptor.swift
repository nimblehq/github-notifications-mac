//
//  AuthenticatedInterceptor.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation
import Alamofire

final class AuthenticatedInterceptor: RequestInterceptor {

    private let keychain: KeychainProtocol

    init(keychain: KeychainProtocol) {
        self.keychain = keychain
    }

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        if let token = try? keychain.get(.authToken) {
            request.headers.add(name: "Authorization", value: "token \(token)")
            completion(.success(request))
        } else {
            completion(.failure(GithubAPIError.genericError))
        }
    }
}

