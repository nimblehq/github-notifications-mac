//
//  AppDelegate.swift
//  GithubNotifications
//
//  Created by Bliss on 7/9/21.
//

import UIKit
import Combine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var networkPoll: NetworkPoll?
    var pollNotificationSubscription: AnyCancellable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        NetworkServiceFactory.shared.setUp(baseURL: Constants.Network.baseURLPath)

        setUpNetworkPoll()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {

    func setUpNetworkPoll() {
        networkPoll = NetworkPoll(notificationService: NetworkServiceFactory.shared.createNotificationSercice())
        pollNotificationSubscription = networkPoll?.pollNotification(60)
            .sink(receiveValue: { models in
                #warning("Show notification for received models")
            })
    }
}
