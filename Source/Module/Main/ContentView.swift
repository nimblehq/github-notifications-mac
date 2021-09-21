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
        UITableViewCell.appearance().selectionStyle = .none
    }

    var body: some View {
        NavigationView {
            if isLoggedIn {
                makePreferenceSideBarView()
                GeneralScreen() // set default screen
            } else {
                makeLoginSideBarView()
                LoginScreen(isLoggedIn: $isLoggedIn) // set default screen
            }
        }
    }

    private func makePreferenceSideBarView() -> some View {
        List() {
            NavigationLink(
                destination: GeneralScreen(),
                label: { Text(PreferenceTabType.general.title).font(.title2) }
            )
            .padding(.top, 50.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))

            NavigationLink(
                destination: RepositoryScreen(),
                label: { Text(PreferenceTabType.repositories.title).font(.title2) }
            )
            .padding(.top, 20.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))

            NavigationLink(
                destination: AccountScreen(),
                label: { Text(PreferenceTabType.account.title).font(.title2) }
            )
            .padding(.top, 20.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Preferences")
    }

    private func makeLoginSideBarView() -> some View {
        List() {
            NavigationLink(
                destination: LoginScreen(isLoggedIn: $isLoggedIn),
                label: { Text(LoginTabType.accessToken.title).font(.title2) }
            )
            .padding(.top, 50.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Login")
    }
}

extension ContentView {

    enum LoginTabType: Int, CaseIterable {

        case accessToken

        var title: String {
            switch self {
            case .accessToken: return "Access Token"
            }
        }
    }

    enum PreferenceTabType: Int, CaseIterable {

        case general
        case repositories
        case account

        var title: String {
            switch self {
            case .general: return "General"
            case .repositories: return "Repositories"
            case .account: return "Account"
            }
        }
    }
}
