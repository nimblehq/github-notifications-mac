//
//  SearchBar.swift
//  GithubNotifications
//
//  Created by Su T. Nguyen on 10/09/2021.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct SearchBar: View {

    @Binding var text: String // the inputted search text
    var placeholder: String
    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .disableAutocorrection(true)
                .padding(.vertical, 8.0)
                .padding(.leading, 30.0)
                .padding(.trailing, 25.0)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8.0)
                            .padding(.top, -1.0)

                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    })
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil, from: nil, for: nil
                    )
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 8.0)
                .transition(.opacity)
                .animation(.easeInOut)
            }
        }
    }
}
