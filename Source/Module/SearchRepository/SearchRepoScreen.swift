//
//  SearchRepoScreen.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 09/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct SearchRepoScreen: View {

    @Binding var showSearchScreen: Bool

    @State private var searchText = "" {
        didSet {
            print(searchText)
        }
    }
    @State private var isShowing = true

    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(text: $searchText, placeholder: "Search repositories to notify")
                .border(.darkBorder, width: 1.0, radius: 8.0)
                .frame(maxWidth: .infinity)
                .paddingLeft8()

            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(Array(RepositoryCellViewModel.dummy.enumerated()), id: \.offset) { index, item in
                        RepositoryCell(viewModel: item)
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
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Repositories")
        .foregroundColor(.almostBlack)
    }
}

// MARK: - Private

extension SearchRepoScreen {

    fileprivate func makeAddButton() -> some View {
        Button {
            showSearchScreen = false
        } label: {
            Text("Done")
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
