//
//  KeychainKey.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

protocol KeychainKey {}

extension KeychainKey {

    static var authToken: Keychain.Key<String> {
        Keychain.Key(key: "authToken")
    }
}
