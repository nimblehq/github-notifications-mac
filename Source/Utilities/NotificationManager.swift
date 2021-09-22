//
//  NotificationManager.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/21/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI
import Combine
import UserNotifications

final class NotificationManager {

    private let notificationCenter = UNUserNotificationCenter.current()
    private var isAuthorized: Bool = false

    @AppStorage
    private var notificationHasSound: Bool

    private var cancellableBag = Set<AnyCancellable>()

    init(store: UserDefaults = UserDefaults.standard) {
        _notificationHasSound = AppStorage(
            wrappedValue: store.bool(forKey: AppStorage<Any>.Keys.notificationHasSound()),
            AppStorage<Any>.Keys.notificationHasSound(),
            store: store
        )
    }

    private func getNotificationType(reason: NotificationReason) -> NotificationType {
        switch reason {
        case .author:
            return .reviewed
        default:
            #warning("Remove default and `undefined` when handle all cases")
            return .undefined
        }
    }

    func scheduleNotification(reason: NotificationReason, repoName: String, prTitle: String) {
        if isAuthorized {
            let type = self.getNotificationType(reason: reason)

            let content = UNMutableNotificationContent()
            content.title = "\(repoName)"
            content.body = "\(type.title) on: \(prTitle)"
            content.sound = notificationHasSound ? UNNotificationSound.default : nil

            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: nil)

            notificationCenter.add(request)
        }
    }

    func requestNotificationPermission() {
        notificationCenter.getNotificationSettings()
            .flatMap { settings -> AnyPublisher<Bool, Never> in
                switch settings.authorizationStatus {
                case .denied:
                    return Just(false)
                        .eraseToAnyPublisher()
                case .notDetermined:
                    return self.notificationCenter.requestAuthorization(options: [.alert, .sound, .badge])
                        .replaceError(with: false)
                        .eraseToAnyPublisher()
                default:
                    return Just(true)
                        .eraseToAnyPublisher()
                }
            }
            .sink(receiveValue: { authorized in
                self.isAuthorized = authorized
            })
            .store(in: &cancellableBag)
    }
}

extension NotificationManager {

    enum NotificationType {

        case reviewed
        case undefined

        var title: String {
            switch self {
            case .reviewed: return "Reviewed"
            case .undefined: return ""
            }
        }
    }
}
