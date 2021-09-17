//
//  APIUser.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/10/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

struct APIUser: Decodable {

    let login: String
    let htmlUrl: String
    let name: String?
    let email: String?
}
