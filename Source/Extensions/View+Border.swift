//
//  View+Overlay.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 09/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

extension View {

    func border(
        _ color: Color = .black,
        width: CGFloat = 0.0,
        radius: CGFloat = 0.0
    ) -> some View {
        overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: width)
        )
    }
}
