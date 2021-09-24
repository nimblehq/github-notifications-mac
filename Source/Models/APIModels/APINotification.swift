//
//  APINotification.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

struct APINotification: Decodable {

    let id: String
    let repository: Repository
    let subject: Subject
    let reason: NotificationReason
    let unread: Bool
    let updatedAt: Date
    let lastReadAt: Date?
    let url: String
}

extension APINotification {

    struct Repository: Decodable {

        let id: Int
        let nodeId, name, fullName: String
        let `private`: Bool
        let htmlUrl: String
        let description: String?
        let fork: Bool
        let url: String
    }

    struct Subject: Decodable {

        private enum CodingKeys : String, CodingKey {
            case title, type
            case apiURL = "url"
        }

        let title: String
        let type: NotificationSubjectType

        // Replace with web url
        private let apiURL: String
        var url: String {
            var url = apiURL.replacingOccurrences(
                of: "api.github.com/repos",
                with: "github.com"
            )

            // TODO: Fix url case by case
            // Fix PR url
            url = url.replacingOccurrences(
                of: "/pulls/",
                with: "/pull/"
            )

            return url
        }
    }
}
