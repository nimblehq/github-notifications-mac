//
//  Color+Hex.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 09/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

extension Color {

    static let border = Color(hex: 0xECECEC)
    static let brightGray = Color(hex: 0x797979)
    static let almostBlack = Color(hex: 0x232526)

    init(hex: Int) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: 1.0
        )
    }
}
