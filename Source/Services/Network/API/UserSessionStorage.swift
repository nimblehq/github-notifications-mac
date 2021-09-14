//
//  UserSessionStorage.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/13/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

protocol UserSessionStorageProtocol: AnyObject {

    var authToken: String? { get set }
    var username: String? { get set }
    var isLoggedIn: Bool { get }

    func clear()
}

final class UserSessionStorage: UserSessionStorageProtocol {

    private let keychain: KeychainProtocol

    private lazy var storedAuthToken: String? = {
        try? keychain.get(.authToken)
    }()

    private lazy var storedUsername: String? = {
        try? keychain.get(.username)
    }()

    var authToken: String? {
        get { storedAuthToken }
        set {
            storedAuthToken = newValue
            try? keychain.set(authToken ?? "", for: .authToken)
        }
    }

    var username: String? {
        get { storedUsername }
        set {
            storedUsername = newValue
            try? keychain.set(username ?? "", for: .username)
        }
    }

    var isLoggedIn: Bool {
        storedAuthToken != nil
    }

    init(keychain: KeychainProtocol = Keychain.default) {
        self.keychain = keychain
    }
    
    func clear() {
        try? keychain.remove(.authToken)
        try? keychain.remove(.username)
    }
}
