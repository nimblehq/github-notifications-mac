//
//  NotificationSubjectType.swift
//  Github Notifications
//
//  Created by Chananchida F. on 9/23/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

enum NotificationSubjectType: String, Decodable {

    case pullRequest
    case issue
    case release
    case unknown

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        let decoded = NotificationSubjectType(rawValue: value.capitalized)
        self = decoded ?? .unknown
    }
}
