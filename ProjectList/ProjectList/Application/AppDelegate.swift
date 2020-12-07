//
//  AppDelegate.swift
//  ProjectList
//
//  Created by Александр Тонхоноев on 07.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainVC = MainModuleWireframe.createModule()!
        let navigationVC = UINavigationController(rootViewController: mainVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }

}

