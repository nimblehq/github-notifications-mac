//
//  LoginSideBarView.swift
//  GithubNotifications
//
//  Created by Chananchida F. on 9/8/21.
//  Copyright © 2021 Nimblehq. All rights reserved.
//

import SwiftUI

struct LoginSideBarView: View {
    
    init() {
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        List {
            NavigationLink(
                destination: LoginView(),
                label: {
                    Text("Access Token")
                        .font(.title)
                }
            )
            .padding(.top, 50.0)
            .listRowBackground(Color(UIColor.systemGroupedBackground))
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Login")
    }
}

struct LoginSideBar_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginSideBarView()
    }
}
