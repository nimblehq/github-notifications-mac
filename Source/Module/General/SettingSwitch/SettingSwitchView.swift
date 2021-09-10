//
//  SettingSwitchView.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI
import Combine

struct SettingSwitchView: View {

    var title: String
    @Binding var isOn: Bool

    var body: some View {
        HStack {
            Text(title)
                .bold()
            Spacer()
            Toggle(isOn: $isOn, label: {})
            .toggleStyle(SwitchToggleStyle())
        }
        .onTapGesture {
            isOn.toggle()
        }
        .padding(.vertical, 20.0)
    }
}

struct SettingSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SettingSwitchView(title: "Preview", isOn: .constant(true))
    }
}
