//
//  RepositoryScreen.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 09/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct RepositoryScreen: View {

    @State fileprivate var showSearchScreen: Bool = false

    var body: some View {
        makeRepoListView()
    }

    private func makeRepoListView() -> some View {
        VStack(alignment: .leading) {
            Text("You will receive all notifications of these repositories.")
                .paddingLeft8()
                .foregroundColor(.brightGray)

            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(Array(RepositoryCellViewModel.dummy.enumerated()), id: \.offset) { index, item in
                        RepositoryCell(viewModel: item, isNotifying: true)
                            .background(
                                index % 2 == 0 ? Color.white : Color.gray.opacity(0.1)
                            )
                    }
                }
                .cornerRadius(8.0)
            }
            .border(.border, width: 1.0, radius: 8.0)
            .paddingLeft8()

            HStack {
                Spacer()
                makeAddButton()
                    .background(NavigationLink(
                        destination: SearchRepoScreen(showSearchScreen: $showSearchScreen),
                        isActive: $showSearchScreen,
                        label: { EmptyView() }
                    ))
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Repositories")
        .foregroundColor(.almostBlack)
    }
}

// MARK: - Private

extension RepositoryScreen {

    fileprivate func makeAddButton() -> some View {
        Button {
            showSearchScreen = true
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
}

extension View {

    fileprivate func paddingLeft8() -> some View {
        padding(.leading, 8.0)
    }
}

struct RepositoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryScreen()
    }
}
