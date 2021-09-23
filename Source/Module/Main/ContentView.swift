//
//  ContentView.swift
//  GithubNotifications
//
//  Created by Bliss on 7/9/21.
//

import SwiftUI

struct ContentView: View {

    @State private var isLoggedIn: Bool = false
    @State private var selectedItemId: Int? = 0
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
                LoginScreen(isLoggedIn: $isLoggedIn)
            }
        }
        .onChange(of: isLoggedIn) { _ in
            selectedItemId = isLoggedIn ? 0 : LoginTabType.accessToken.rawValue
        }
    }
    
    // MARK: - Logged In Sidebar

    private func makePreferenceSideBarView() -> some View {
        List() {
            ForEach(PreferenceTabType.allCases, id: \.rawValue) { item in
                NavigationLink(
                    destination: view(for: item),
                    tag: item.rawValue,
                    selection: $selectedItemId) {
                        Text(item.title)
                            .font(item.rawValue == selectedItemId ? .title2.bold() : .title2)
                }
                .padding(.top, 50.0)
                .listRowBackground(Color(UIColor.systemGroupedBackground))
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Preferences")
    }

    @ViewBuilder
    private func view(for destination: PreferenceTabType) -> some View {
        switch destination {
        case .general: GeneralScreen()
        case .repositories: RepositoryScreen()
        case .account: AccountScreen(isLoggedIn: $isLoggedIn)
        }
    }

    // MARK: - Logged Out Sidebar

    private func makeLoginSideBarView() -> some View {
        List() {
            NavigationLink(
                destination: LoginScreen(isLoggedIn: $isLoggedIn),
                tag: LoginTabType.accessToken.rawValue,
                selection: $selectedItemId,
                label: { Text(LoginTabType.accessToken.title).font(.title2.bold()) }
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

        case accessToken = -1

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
