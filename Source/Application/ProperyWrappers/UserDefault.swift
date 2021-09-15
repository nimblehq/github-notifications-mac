//
//  UserDefault.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/15/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {

    let userDefaults: UserDefaults
    let key: UserDefaultsKey<T>
    let defaultValue: T

    init(
        userDefaults: UserDefaults = UserDefaults.standard,
        key: UserDefaultsKey<T>,
        defaultValue: T
    ) {
        self.userDefaults = userDefaults
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if let data = userDefaults.data(forKey: key.key) {
                if let value = try? JSONDecoder().decode(T.self, from: data) {
                    return value
                }
            }
            return defaultValue
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                userDefaults.set(data, forKey: key.key)
            }
        }
    }

    func remove() {
        userDefaults.removeObject(forKey: key.key)
    }
}
