//
//  RoundedCornersButtonStyle.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/8/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct RoundedCornersStyle: ButtonStyle {
 
    var color: Color = Color.black
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 155.0, height: 30.0, alignment: .center)
            .background(configuration.isPressed ? color.opacity(0.5) : color)
            .cornerRadius(8.0)
    }
}
