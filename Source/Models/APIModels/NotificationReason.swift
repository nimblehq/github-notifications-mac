//
//  NotificationReason.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

enum NotificationReason: String, Decodable {

    /// You were assigned to the issue.
    case assign
    /// You created the thread.
    case author
    /// You commented on the thread.
    case comment
    /// You accepted an invitation to contribute to the repository.
    case invitation
    /// You subscribed to the thread (via an issue or pull request).
    case manual
    /// You were specifically @mentioned in the content.
    case mention
    /// You, or a team you're a member of, were requested to review a pull request.
    case review_requested
    /// GitHub discovered a security vulnerability in your repository.
    case security_alert
    /// You changed the thread state (for example, closing an issue or merging a pull request).
    case state_change
    /// You're watching the repository.
    case subscribed
    /// You were on a team that was mentioned.
    case team_mention
    case unknown

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        let decoded = NotificationReason(rawValue: value)
        self = decoded ?? .unknown
    }
}
