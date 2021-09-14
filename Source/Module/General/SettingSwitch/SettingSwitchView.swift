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

    var viewModel: SettingSwitchViewModel

    var body: some View {
        HStack {
            Text(viewModel.title)
                .bold()
            Spacer()
            Toggle(isOn: viewModel.$isOn, label: {})
            .toggleStyle(SwitchToggleStyle())
        }
        .onTapGesture {
            viewModel.isOn.toggle()
        }
        .padding(.vertical, 20.0)
    }
}

struct SettingSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SettingSwitchView(viewModel: SettingSwitchViewModel(title: "Preview", isOn: .constant(true)))
    }
}
