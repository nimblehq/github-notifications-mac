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
}

class GeneralScreenObservable: ObservableObject, GeneralScreenObservableProtocol {

    init(store: UserDefaults = UserDefaults.standard) {
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
    }

    @AppStorage
    private var notificationHasSound: Bool
    
    @AppStorage
    private var repeatPullRequestNotification: Bool

    func getGeneralSettings() -> [SettingSwitchViewModel] {
        [
            SettingSwitchViewModel(title:"Play sound", isOn: $notificationHasSound),
            SettingSwitchViewModel(title:"Repeat review requested notifications", isOn: $repeatPullRequestNotification)
        ]
    }
}
