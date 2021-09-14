//
//  NetworkPoll.swift
//  GithubNotifications
//
//  Created by Bliss on 13/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation
import Combine

protocol NetworkPollProtocol {

    func pollNotification(_ every: TimeInterval) -> AnyPublisher<[APINotification], Never>
}

class NetworkPoll: NetworkPollProtocol {

    let notificationService: NotificationsServiceProtocol

    init(notificationService: NotificationsServiceProtocol) {
        self.notificationService = notificationService
    }

    func pollNotification(_ every: TimeInterval) -> AnyPublisher<[APINotification], Never> {
        Timer.publish(every: every, on: .main, in: .common)
            .autoconnect()
            .compactMap { [weak self] _ in
                self?.notificationService.getNotifications().replaceError(with: [])
            }
            .flatMap { $0 }
            .eraseToAnyPublisher()
    }
}
