//
//  ContentViewModel.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/14/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

protocol ContenViewModelProtocol {

    func getIsLoggedIn() -> Bool
}

final class ContentViewModel: ObservableObject, ContenViewModelProtocol {

    private var userSession: UserSessionStorageProtocol

    init(userSession: UserSessionStorageProtocol) {
        self.userSession = userSession
    }

    func getIsLoggedIn() -> Bool {
        return userSession.isLoggedIn
    }
}
