//
//  GeneralScreenObservable.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

protocol GeneralScreenObservableProtocol {

    func getGeneralSettings() -> [SettingSwitchViewModel]
    func didToggleRepeatPullRequestNotification()
}

class GeneralScreenObservable: ObservableObject, GeneralScreenObservableProtocol {

    init(
        store: UserDefaults = UserDefaults.standard,
        notificationManager: NotificationManagerProtocol
    ) {
        _notificationHasSound = AppStorage(
            wrappedValue: true,
            AppStorage<Any>.Keys.notificationHasSound(),
            store: store
        )
        _repeatPullRequestNotification = AppStorage(
            wrappedValue: false,
            AppStorage<Any>.Keys.repeatPullRequestNotification(),
            store: store
        )
        self.notificationManager = notificationManager
    }

    @AppStorage
    private var notificationHasSound: Bool

    @AppStorage
    var repeatPullRequestNotification: Bool

    private var notificationManager: NotificationManagerProtocol

    func getGeneralSettings() -> [SettingSwitchViewModel] {
        [
            SettingSwitchViewModel(title:"Play sound", isOn: $notificationHasSound),
            SettingSwitchViewModel(title:"Repeat review requested notifications", isOn: $repeatPullRequestNotification)
        ]
    }

    func didToggleRepeatPullRequestNotification() {
        notificationManager.didChangeRepeatPullRequestNotification(to: repeatPullRequestNotification)
    }
}
