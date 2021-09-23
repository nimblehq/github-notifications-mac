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

final class NotificationManager: NSObject {

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
        super.init()

        notificationCenter.delegate = self
    }

    private func getNotificationType(reason: NotificationReason) -> NotificationType {
        switch reason {
        case .author: return .reviewed
        case .mention: return .mentioned
        case .review_requested: return .reviewRequested
        case .assign: return .assigned
        default: return .undefined
        }
    }

    func scheduleNotification(
        reason: NotificationReason,
        repoName: String,
        prTitle: String,
        url: String
    ) {
        if isAuthorized {
            let type = self.getNotificationType(reason: reason)

            let content = UNMutableNotificationContent()
            content.title = "\(repoName)"
            content.body = "\(type.title) on: \(prTitle)"
            content.sound = notificationHasSound ? UNNotificationSound.default : nil
            content.userInfo = [
                "url": url
            ]
            
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

extension NotificationManager: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case UNNotificationDefaultActionIdentifier:
            guard let stringURL = response
                    .notification
                    .request
                    .content
                    .userInfo["url"] as? String,
                  let url = try? stringURL.asURL() else { break }
            UIApplication.shared.open(url)
        default: break
        }

        completionHandler()
    }
}

extension NotificationManager {

    enum NotificationType {

        case reviewed
        case reviewRequested
        case mentioned
        case assigned
        case ciUpdated // Currently, CI updated only support for email and website.
        case undefined

        var title: String {
            switch self {
            case .reviewed: return "Reviewed"
            case .reviewRequested: return "Review requested"
            case .mentioned: return "Mentioned"
            case .assigned: return "Assigned"
            case .ciUpdated: return "CI updated"
            case .undefined: return ""
            }
        }
    }
}
