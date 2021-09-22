//
//  AppStorage+Key.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

extension AppStorage {

    enum Keys: String {
        case notificationHasSound
        case repeatPullRequestNotification
        case notifiedRepositories
        case latestNotificationDate

        func callAsFunction() -> String {
            self.rawValue
        }
    }
}
