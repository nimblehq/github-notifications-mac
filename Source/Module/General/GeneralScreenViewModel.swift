//
//  GeneralScreenViewModel.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

class GeneralScreenObservable: ObservableObject {

    @AppStorage(AppStorage<Any>.Keys.notificationHasSound.rawValue)
    var notificationHasSound: Bool = true
    
    @AppStorage(AppStorage<Any>.Keys.repeatPullRequestNotification.rawValue)
    var repeatPullRequestNotification: Bool = false
}
