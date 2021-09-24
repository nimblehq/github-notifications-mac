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

    private let notificationManager = NotificationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        NetworkServiceFactory.shared.setUp(baseURL: Constants.Network.baseURLPath)

        notificationManager.requestNotificationPermission()

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
        networkPoll = NetworkPoll(notificationService: NetworkServiceFactory.shared.createNotificationService())
        pollNotificationSubscription = networkPoll?.pollNotification(60)
            .sink(receiveValue: { notifications in
                notifications.forEach {
                    var isShowNotiBanner: Bool = false
                    switch $0.reason {
                    case .assign, .mention, .review_requested:
                        isShowNotiBanner = true
                    case .author:
                        isShowNotiBanner = $0.subject.type == .pullRequest ? true : false
                    default:
                        #warning("Handle for other cases")
                        isShowNotiBanner = false
                    }
                    if isShowNotiBanner {
                        self.notificationManager.scheduleNotification(
                            reason: $0.reason,
                            repoName: $0.repository.fullName,
                            prTitle: $0.subject.title,
                            url: $0.subject.url
                        )
                    }
                }
            })
    }
}
