//
//  GeneralScreen.swift
//  GithubNotifications
//
//  Created by Bliss on 10/9/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct GeneralScreen: View {

    @ObservedObject var generalScreenObservable = GeneralScreenObservable(
        notificationManager: NotificationManager()
    )

    var body: some View {
        makeSettingListView()
    }

    private func makeSettingListView() -> some View {
        List {
            let generalSettings = generalScreenObservable.getGeneralSettings()
            ForEach(generalSettings.indices) {
                SettingSwitchView(viewModel: generalSettings[$0])
            }
        }
        .padding(.leading, 8.0)
        .navigationTitle("General")
        .foregroundColor(.almostBlack)
        .onChange(of: generalScreenObservable.repeatPullRequestNotification) { _ in
            generalScreenObservable.didToggleRepeatPullRequestNotification()
        }
    }
}

struct GeneralScreen_Previews: PreviewProvider {
    static var previews: some View {
        GeneralScreen()
    }
}
