//
//  RepositoryViewModel.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 21/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Combine

final class RepositoryViewModel: ObservableObject {

    @Published var cellViewModels: [RepositoryCellViewModel] = []
    @Published var notifiedRepositoryObservable = NotifiedRepositoryObservable()

    private var cancellableBag = Set<AnyCancellable>()

    func updateIfNeeded() {
        cellViewModels = notifiedRepositoryObservable.getNotifiedRepositories()
        print("cellViewModels: \(cellViewModels.map { $0.name })")
    }

    func getIsNotifying(for repo: RepositoryCellViewModel) -> Bool {
        notifiedRepositoryObservable.getIsNotifying(repo)
    }
}
