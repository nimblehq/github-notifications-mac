//
//  ContentView.swift
//  GithubNotifications
//
//  Created by Bliss on 7/9/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            makeSideBarView()
        }
    }

    private func makeSideBarView() -> some View {
        List() {
            NavigationLink(
                destination: LoginScreen(),
                label: { Text(TabType.accessToken.title).font(.title2) }
            )
            .padding(.top, 50.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))

            NavigationLink(
                destination: RepositoryScreen(),
                label: { Text(TabType.repositories.title).font(.title2) }
            )
            .padding(.top, 20.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Preferences")
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
