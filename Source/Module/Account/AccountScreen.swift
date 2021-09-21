//
//  AccountScreen.swift
//  GithubNotifications
//
//  Created by Mark G on 21/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct AccountScreen: View {

    @ObservedObject private var viewModel = AccountViewModel(
        userService: NetworkServiceFactory.shared.createUserService(),
        userSession: UserSessionStorage()
    )
    @Binding private var isLoggedIn: Bool

    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.isFetching {
                if viewModel.isFetchingFailed {
                    Text("Unable to fetch user information")
                } else {
                    ProgressView()
                }
            } else {
                content
            }
            Spacer()
        }
        .padding(.horizontal, 20.0)
        .padding(.top, 50.0)
        .navigationTitle("Account")
        .foregroundColor(.almostBlack)
        .onAppear {
            viewModel.fetch()
        }
    }

    var content: some View {
        Group {
            Text("Username")
                .foregroundColor(.brightGray)
            HStack {
                Text("@\(viewModel.username)")
                    .font(.body.bold())
                Spacer()
                Button {
                    viewModel.signOut()
                    isLoggedIn = false
                } label: {
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
        }
    }

    init(isLoggedIn: Binding<Bool>) {
        _isLoggedIn = isLoggedIn
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen(isLoggedIn: .constant(true))
    }
}
