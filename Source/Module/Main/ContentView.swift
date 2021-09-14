//
//  ContentView.swift
//  GithubNotifications
//
//  Created by Bliss on 7/9/21.
//

import SwiftUI

struct ContentView: View {

    @State private var isLoggedIn: Bool = false
    @ObservedObject var viewModel = ContentViewModel(userSession: UserSessionStorage())

    init() {
        _isLoggedIn = State(initialValue: viewModel.getIsLoggedIn())
    }

    var body: some View {
        NavigationView {
            if isLoggedIn {
                makePreferenceSideBarView()
                RepositoryScreen() // set default screen
            } else {
                makeLoginSideBarView()
                LoginScreen(isLoggedIn: $isLoggedIn) // set default screen
            }
        }
    }

    private func makePreferenceSideBarView() -> some View {
        List() {
            NavigationLink(
                destination: RepositoryScreen(),
                label: { Text(TabType.repositories.title).font(.title2) }
            )
            .padding(.top, 50.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Preferences")
    }

    private func makeLoginSideBarView() -> some View {
        List() {
            NavigationLink(
                destination: LoginScreen(isLoggedIn: $isLoggedIn),
                label: { Text(TabType.accessToken.title).font(.title2) }
            )
            .padding(.top, 50.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Login")
    }
}

extension ContentView {

    enum TabType: Int, CaseIterable {

        case accessToken
        case repositories

        var title: String {
            switch self {
            case .accessToken: return "Access Token"
            case .repositories: return "Repositories"
            }
        }
    }
}
