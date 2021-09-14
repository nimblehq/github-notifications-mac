//
//  SwitchToggleStyle.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct SwitchToggleStyle: ToggleStyle {

    var activeColor: Color = .almostBlack

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Rectangle()
                .foregroundColor(configuration.isOn ? activeColor : .gray)
                .frame(width: 37.0, height: 22.0, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 2.0)
                        .offset(x: configuration.isOn ? 7.0 : -7.0, y: 0.0)
                        .animation(Animation.linear(duration: 0.1))

                )
                .cornerRadius(11.0)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
