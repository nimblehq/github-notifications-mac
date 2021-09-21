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
