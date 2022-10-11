//
//  AppDelegate.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 21.09.2022.
//

import UIKit
import MapKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = CustomTabBarController()
//        let navigationVC = UINavigationController(rootViewController: vc)
        let navigationVC = UINavigationController(rootViewController: vc)
        self.window = UIWindow(frame:UIScreen.main.bounds)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        print("root")
        return true
    }
}
