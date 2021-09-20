//
//  Repository.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 10/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

struct Repository: Decodable {

    enum CodingKeys: String, CodingKey {
        case name = "full_name"
    }

    let name: String
}
