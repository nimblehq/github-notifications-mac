//
//  NotificationsService.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Combine

// sourcery: AutoMockable
protocol NotificationsServiceProtocol {

    func getNotifications() -> AnyPublisher<[APINotification], Error>
}

final class NotificationsService: NotificationsServiceProtocol {

    private let networkAPI: API

    init(networkAPI: API) {
        self.networkAPI = networkAPI
    }

    func getNotifications() -> AnyPublisher<[APINotification], Error> {
        networkAPI.performRequest(
            with: NotificationRequestConfiguration.notifications
        )
    }
}
