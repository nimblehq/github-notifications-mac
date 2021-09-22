//
//  NetworkPoll.swift
//  GithubNotifications
//
//  Created by Bliss on 13/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

protocol NetworkPollProtocol {

    func pollNotification(_ every: TimeInterval) -> AnyPublisher<[APINotification], Never>
}

class NetworkPoll: NetworkPollProtocol {

    let notificationService: NotificationsServiceProtocol

    @AppStorage
    private var latestNotificationInterval: TimeInterval
    
    init(notificationService: NotificationsServiceProtocol, store: UserDefaults = UserDefaults.standard) {
        self.notificationService = notificationService
        _latestNotificationInterval = AppStorage(
            wrappedValue: 0.0,
            AppStorage<Any>.Keys.latestNotificationDate(),
            store: store
        )
    }

    func pollNotification(_ every: TimeInterval) -> AnyPublisher<[APINotification], Never> {
        Timer.publish(every: every, on: .main, in: .common)
            .autoconnect()
            .compactMap { [weak self] _ in
                self?.notificationService.getNotifications().replaceError(with: [])
            }
            .flatMap { [weak self] publisher in
                publisher.map {
                    $0
                        .sorted { $0.updatedAt < $1.updatedAt }
                        .filter { self?.newerThanLastest($0) ?? true }
                }
            }
            .eraseToAnyPublisher()
    }

    private func newerThanLastest(_ notification: APINotification) -> Bool {
        let latestNotificationInterval = self.latestNotificationInterval
        if notification.updatedAt.timeIntervalSince1970 >= latestNotificationInterval {
            self.latestNotificationInterval = notification.updatedAt.timeIntervalSince1970
            return true
        }
        return false
    }
}
