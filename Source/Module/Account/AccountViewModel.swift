//
//  AccountViewModel.swift
//  GithubNotifications
//
//  Created by Mark G on 21/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class AccountViewModel: ObservableObject {

    private let userService: UserServiceProtocol
    private let userSession: UserSessionStorageProtocol
    private var cancellableBag = Set<AnyCancellable>()

    @Published var username: String = ""
    @Published var isFetchingFailed: Bool = false
    @Published var isFetching: Bool = false

    init(
        userService: UserServiceProtocol,
        userSession: UserSessionStorageProtocol
    ) {
        self.userService = userService
        self.userSession = userSession
    }

    func fetch() {
        isFetching = true
        userService.getUser()
            .sink { [weak self] in
                guard let self = self else { return }

                switch $0 {
                case .failure: self.isFetchingFailed = true
                default: break
                }
                self.isFetching = false
            } receiveValue: { [weak self] in
                self?.username = $0.name ?? ""
            }
            .store(in: &cancellableBag)
    }

    func signOut() {
        userSession.clear()
    }
}
