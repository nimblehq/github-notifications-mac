//
//  GeneralScreenObservable.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

class GeneralScreenObservable: ObservableObject {

    @AppStorage(AppStorage<Any>.Keys.notificationHasSound.rawValue)
    private var notificationHasSound: Bool = true
    
    @AppStorage(AppStorage<Any>.Keys.repeatPullRequestNotification.rawValue)
    private var repeatPullRequestNotification: Bool = false

    func getGeneralSettings() -> [SettingSwitchViewModel] {
        [
            SettingSwitchViewModel(title:"Play sound", isOn: $notificationHasSound),
            SettingSwitchViewModel(title:"Repeat review requested notifications", isOn: $repeatPullRequestNotification)
        ]
    }
}
