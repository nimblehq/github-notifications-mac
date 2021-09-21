//
//  LoginViewModel.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/13/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

protocol LoginViewModelProtocol {

    func getUser(token: String, completion: @escaping CompletionHandler)
}

final class LoginViewModel: ObservableObject, LoginViewModelProtocol {

    private var userService: UserServiceProtocol
    private var userSession: UserSessionStorageProtocol

    var userSubscription: AnyCancellable?

    init(userService: UserServiceProtocol, userSession: UserSessionStorageProtocol) {
        self.userService = userService
        self.userSession = userSession
    }
    
    func getUser(token: String, completion: @escaping CompletionHandler) {
        userSubscription = userService.getUser(token: token)
            .sink(
                receiveCompletion: { _ in
                    #warning("Show error when failed to get user")
                }, receiveValue: { [weak self] user in
                    self?.userSession.authToken = token
                    self?.userSession.username = user.login
                    completion()
                }
            )
    }
}
