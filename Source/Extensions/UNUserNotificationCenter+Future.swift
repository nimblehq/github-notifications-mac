//
//  UNUserNotificationCenter+Future.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/22/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import UserNotifications
import Combine

extension UNUserNotificationCenter {

    func getNotificationSettings() -> Future<UNNotificationSettings, Never> {
        return Future { promise in
            self.getNotificationSettings { settings in
                promise(.success(settings))
            }
        }
    }

    func requestAuthorization(options: UNAuthorizationOptions) -> Future<Bool, Error> {
        return Future { promise in
            self.requestAuthorization(options: options) { granted, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(granted))
                }
            }
        }
    }
}
