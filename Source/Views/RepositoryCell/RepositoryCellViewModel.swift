//
//  RepositoryCellViewModel.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 10/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

struct RepositoryCellViewModel: Identifiable {

    var id: String { name }
    let name: String

    init(repository: Repository) {
        name = repository.name
    }
}

extension RepositoryCellViewModel {

    static var dummy: [RepositoryCellViewModel] {
        [
            .init(repository: .init(name: "nimblehq/nimble-medium-ios1")),
            .init(repository: .init(name: "nimblehq/rails-templates1")),
            .init(repository: .init(name: "nimblehq/internal-certification-ruby1")),
            .init(repository: .init(name: "nimblehq/elixir-templates1")),
            .init(repository: .init(name: "nimblehq/nimble-medium-ios2")),
            .init(repository: .init(name: "nimblehq/rails-templates2")),
            .init(repository: .init(name: "nimblehq/internal-certification-ruby2")),
            .init(repository: .init(name: "nimblehq/elixir-templates2")),
            .init(repository: .init(name: "nimblehq/nimble-medium-ios3")),
            .init(repository: .init(name: "nimblehq/rails-templates3")),
            .init(repository: .init(name: "nimblehq/internal-certification-ruby3")),
            .init(repository: .init(name: "nimblehq/elixir-templates3")),
            .init(repository: .init(name: "nimblehq/nimble-medium-ios4")),
            .init(repository: .init(name: "nimblehq/rails-templates4")),
            .init(repository: .init(name: "nimblehq/internal-certification-ruby4")),
            .init(repository: .init(name: "nimblehq/elixir-templates4")),
            .init(repository: .init(name: "nimblehq/nimble-medium-ios5")),
            .init(repository: .init(name: "nimblehq/rails-templates5")),
            .init(repository: .init(name: "nimblehq/internal-certification-ruby5")),
            .init(repository: .init(name: "nimblehq/elixir-templates5")),
        ]
    }
}
