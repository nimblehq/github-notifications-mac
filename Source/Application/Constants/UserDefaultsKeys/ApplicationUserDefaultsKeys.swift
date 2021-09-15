//
//  ApplicationUserDefaultsKeys.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/15/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

extension UserDefaultsKeys {

    static var selectedRepos: UserDefaultsKey<[String]> {
        return UserDefaultsKey("Selected Repositories")
    }
}
