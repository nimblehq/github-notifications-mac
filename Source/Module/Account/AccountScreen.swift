//
//  AccountScreen.swift
//  GithubNotifications
//
//  Created by Mark G on 21/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct AccountScreen: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            // TODO: Update with real data in integrate
            Text("Username")
                .foregroundColor(.brightGray)
            HStack {
                Text("@suho")
                    .font(.body.bold())
                Spacer()
                Button {} label: {
                    Text("Sign Out")
                        .frame(maxWidth: 160.0)
                }
                .buttonStyle(
                    RoundedButtonStyle(
                        foregroundColor: .black,
                        backgroundColor: .border,
                        pressedColor: .border.opacity(0.5)
                    )
                )
            }
            Spacer()
        }
        .padding(.horizontal, 20.0)
        .padding(.top, 50.0)
        .navigationTitle("Account")
        .foregroundColor(.almostBlack)
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
