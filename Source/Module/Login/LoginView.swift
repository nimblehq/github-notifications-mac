//
//  LoginView.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/8/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct LoginView: View {

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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Token")
                .font(.smallTitle)
                .padding(.top, 50.0)
            
            TextField("The 40 characters token generated on Github", text: $token)
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
                    action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                    label: {
                        Text("Login")
                            .font(.smallDescription)
                            .foregroundColor(.white)
                    }
                )
                .buttonStyle(RoundedCornersStyle())
            }
            
            Spacer()
        }
        .padding(.horizontal, 25.0)
        .navigationTitle("Login with an access token")
    }
}

struct LoginScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
}
