//
//  RoundedButton.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 09/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {

    var foregroundColor: Color
    var backgroundColor: Color
    var pressedColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10.0)
            .foregroundColor(foregroundColor)
            .background(configuration.isPressed ? pressedColor : backgroundColor)
            .cornerRadius(6.0)
    }
}
