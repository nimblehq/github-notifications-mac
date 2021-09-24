//
//  String+CamelCase.swift
//  Github Notifications
//
//  Created by Chananchida F. on 9/24/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import Foundation

extension String {

    var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }

    var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }

    var camelized: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: CharacterSet.alphanumerics.inverted)
        let first = String(describing: parts.first ?? "").lowercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})
        return ([first] + rest).joined(separator: "")
    }
}
