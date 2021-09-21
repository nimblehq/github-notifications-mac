//
//  RepositoryCell.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 10/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct RepositoryCell: View {

    @State var viewModel: RepositoryCellViewModel
    @State var isNotifying: Bool
    var didChangeNotity: (() -> Void)? = nil

    @ObservedObject var notifiedReposObservable = NotifiedRepositoryObservable()

    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.body.bold())
                    .foregroundColor(.almostBlack)
                    .padding(.leading, 10.0)
                    .frame(height: 40.0)
            }

            Spacer()

            Button {
                didTapNotifyButton()
            } label: {
                Text(isNotifying ? "Notifying" : "Notify")
                    .frame(maxWidth: 60.0, maxHeight: 5.0)
            }
            .buttonStyle(
                RoundedButtonStyle(
                    foregroundColor: isNotifying ? .white : .almostBlack,
                    backgroundColor: isNotifying ? .almostBlack : .brightGray.opacity(0.5),
                    pressedColor: .almostBlack.opacity(0.5)
                )
            )
            .clipShape(Capsule())
            .padding(.trailing, 8.0)
        }
    }

    private func didTapNotifyButton() {
        if isNotifying {
            notifiedReposObservable.removeRepository(viewModel)
        } else {
            notifiedReposObservable.addRepository(viewModel)
        }
        if let didChangeNotity = didChangeNotity, isNotifying {
            didChangeNotity()
            // Seems viewModel id is cached and status of button has been kept also
            // So this is trick to make sure at RepositoryScreen, notify button is always notifying status
            isNotifying.toggle()
            // toggle twice means true -> false -> true :lol: button status is kept at notifying
        }
        isNotifying.toggle()
    }
}
