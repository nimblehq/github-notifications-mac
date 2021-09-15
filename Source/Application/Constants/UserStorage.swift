//
//  UserStorage.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/15/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

enum UserStorage {

    @UserDefault(key: .selectedRepos, defaultValue: [String]())
    static var selectedRepos: [String]
}

