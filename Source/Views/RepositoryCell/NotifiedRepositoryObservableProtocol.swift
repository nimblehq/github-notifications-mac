//
//  RepositoryCellObservable.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/16/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

protocol NotifiedRepositoryObservableProtocol {

    func getNotifiedRepositories() -> [RepositoryCellViewModel]
    func addRepository(_ repo: RepositoryCellViewModel)
    func removeRepository(_ repo: RepositoryCellViewModel)
    func getIsNotifying(_ repo: RepositoryCellViewModel) -> Bool
}

class NotifiedRepositoryObservable: ObservableObject, NotifiedRepositoryObservableProtocol {

    @AppStorage
    private var notifiedRepositories: [String]

    init(store: UserDefaults = UserDefaults.standard) {
        _notifiedRepositories = AppStorage(
            wrappedValue: [],
            AppStorage<Any>.Keys.notifiedRepositories(),
            store: store
        )
    }

    func getNotifiedRepositories() -> [RepositoryCellViewModel] {
        notifiedRepositories.map {
            let repository = Repository(name: $0)
            return RepositoryCellViewModel(repository: repository)
        }
    }

    func addRepository(_ repo: RepositoryCellViewModel) {
        notifiedRepositories.append(repo.name)
    }

    func removeRepository(_ repo: RepositoryCellViewModel) {
        notifiedRepositories = notifiedRepositories.filter { $0 != repo.name }
    }

    func getIsNotifying(_ repo: RepositoryCellViewModel) -> Bool {
        notifiedRepositories.contains(repo.name)
    }
}
