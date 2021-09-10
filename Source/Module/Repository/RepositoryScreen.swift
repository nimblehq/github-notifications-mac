//
//  RepositoryScreen.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 09/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct RepositoryScreen: View {

    var body: some View {
        NavigationView {
            NavigationView { }
                .navigationTitle("Preferences")

            makeRepoListView()
                .padding()
        }
    }

    private func makeRepoListView() -> some View {
        VStack(alignment: .leading) {
            Text("You will receive all notifications of these repositories.")
                .paddingLeft8()
                .foregroundColor(.brightGray)

            List { }
            .border(.border, width: 1.0, radius: 8.0)
            .paddingLeft8()

            HStack {
                Spacer()
                makeAddButton()
                Spacer()
            }

        }
        .navigationTitle("Repositories")
        .foregroundColor(.almostBlack)
    }
}

extension View {
}

// MARK: - Private

extension View {

    func makeAddButton() -> some View {
        Button {
            print("Add new did tap")
        } label: {
            Text("Add New")
                .frame(maxWidth: 160.0, maxHeight: 18.0)
        }
        .buttonStyle(
            RoundedButtonStyle(
                foregroundColor: .white,
                backgroundColor: .almostBlack,
                pressedColor: .almostBlack.opacity(0.5)
            )
        )
        .padding(.top, 18.0)
        .padding(.bottom, 22.0)
    }

    fileprivate func paddingLeft8() -> some View {
        padding(.leading, 8.0)
    }
}

struct RepositoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryScreen()
    }
}
