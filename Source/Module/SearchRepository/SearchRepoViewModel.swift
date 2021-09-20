//
//  SearchRepoViewModel.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 20/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Combine
import Foundation

final class SearchRepoViewModel: ObservableObject {

    @Published var filteredItems: [RepositoryCellViewModel] = []
    @Published var searchText: String = ""

    private let repositoryService: RepositoryServiceProtocol!
    private var cancellableBag = Set<AnyCancellable>()

    private var cellViewModels: [RepositoryCellViewModel] = []

    init(repositoryService: RepositoryServiceProtocol) {
        self.repositoryService = repositoryService

        $searchText
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: search)
            .store(in: &cancellableBag)
    }

    func getRepositories() {
        repositoryService.getRepositories()
        .sink { _ in
            #warning("Should handle the error")
        } receiveValue: { [weak self] repositories in
            let data = repositories.map(RepositoryCellViewModel.init)
            self?.cellViewModels = data
            self?.filteredItems = data
        }
        .store(in: &cancellableBag)
    }

    private func search(_ text: String) {
        if text.isEmpty {
            filteredItems = cellViewModels
        } else {
            filteredItems = cellViewModels.filter { $0.name.lowercased().contains(text.lowercased()) }
        }
    }
}
