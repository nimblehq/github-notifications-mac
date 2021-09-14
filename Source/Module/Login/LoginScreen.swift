//
//  LoginScreen.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/8/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {

    private let loginDescription: [TextContent] = [
        .text("To generate a token, go to Github, "),
        .link("personal access tokens", link: "https://github.com/settings/tokens"),
        .text(" and create one with "),
        .text("notifications", style: .bold),
        .text(" and "),
        .text("repo", style: .bold),
        .text(" scopes."),
    ]
    
    @State private var token: String = ""
    @Binding var isLoggedIn: Bool
    @ObservedObject var viewModel = LoginViewModel(userService: NetworkServiceFactory.shared.createUserService())
    
    init(isLoggedIn: Binding<Bool>) {
        self._isLoggedIn = isLoggedIn
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        makeLoginView()
    }
    
    private func makeLoginView() -> some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Token")
                .font(.title3)
                .bold()
                .padding(.top, 50.0)
            
            SecureField("The 40 characters token generated on Github", text: $token)
                .disableAutocorrection(true)
                .padding(10.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color(.lightGray), lineWidth: 0.3)
                )

            TextLabelWithHyperlink(content: loginDescription)
                .frame(height: 35.0)
            
            HStack {
                Spacer()
                Button(
                    action: { didTapLoginButton() },
                    label: {
                        Text("Login")
                            .font(.body)
                            .foregroundColor(.white)
                            .frame(maxWidth: 160.0, maxHeight: 18.0)
                    }
                )
                .buttonStyle(
                    RoundedButtonStyle(
                        foregroundColor: .white,
                        backgroundColor: .almostBlack,
                        pressedColor: .almostBlack.opacity(0.5)
                    )
                )
            }
            
            Spacer()
        }
        .padding(.horizontal, 25.0)
        .navigationTitle("Login with an access token")
    }

    private func didTapLoginButton() {
        viewModel.getUser(token: token) {
            isLoggedIn.toggle()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {

    static var previews: some View {
        LoginScreen(isLoggedIn: .constant(false))
    }
}
