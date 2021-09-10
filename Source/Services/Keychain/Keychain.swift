//
//  Keychain.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation
import KeychainAccess

protocol KeychainProtocol: AnyObject {

    func get<T: Decodable>(_ key: Keychain.Key<T>) throws -> T?
    func set<T: Encodable>(_ value: T, for key: Keychain.Key<T>) throws
    func remove<T>(_ key: Keychain.Key<T>) throws
}

final class Keychain: KeychainProtocol {

    struct Key<T>: KeychainKey {

        let key: String
    }

    static let `default` = Keychain()

    private let keychain: KeychainAccess.Keychain

    private init(service: String? = nil, accessGroup: String? = nil) {
        guard let service = service else {
            keychain = KeychainAccess.Keychain()
            return
        }
        keychain = KeychainAccess.Keychain(service: service, accessGroup: accessGroup ?? "")
    }

    func remove<T>(_ key: Keychain.Key<T>) throws {
        try keychain.remove(key.key)
    }

    /// Convert value to array to allow saving primitive type then save to Keychain
    /// More detail here: https://stackoverflow.com/questions/50257242/jsonencoder-wont-allow-type-encoded-to-primitive-value
    func set<T: Encodable>(_ value: T, for key: Key<T>) throws {
        let array = [value]
        do {
            try keychain.set(JSONEncoder().encode(array), key: key.key)
        }
        catch let error {
            print(error)
        }
    }

    func get<T: Decodable>(_ key: Key<T>) throws -> T? {
        try keychain
            .getData(key.key)
            .map { try JSONDecoder().decode([T].self, from: $0) }?
            .first
    }
}
