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

    var userSubscription: AnyCancellable?

    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func getUser(token: String, completion: @escaping CompletionHandler) {
        UserSessionStorage.shared.authToken = token
        userSubscription = userService.getUser()
            .sink(
                receiveCompletion: { completion in
                    print(completion)
                }, receiveValue: { user in
                    UserSessionStorage.shared.username = user.login
                    completion()
                }
            )
    }
}
