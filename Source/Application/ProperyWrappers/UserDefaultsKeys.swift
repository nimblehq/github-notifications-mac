//
//  UserDefaultsKey.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/15/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

protocol UserDefaultsKeys {}

final class UserDefaultsKey<T>: UserDefaultsKeys {

    let key: String

    init(_ key: String) {
        self.key = key
    }
}
