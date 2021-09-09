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
            LoginSideBarView()
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
