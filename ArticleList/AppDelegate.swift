//
//  AppDelegate.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 01/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var moduleFactory: ModuleFactory = ModuleDependencyContainer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.launchInitialScreen()
        return true
    }

}

// Private methods
extension AppDelegate {

    private func launchInitialScreen() {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        if let initialScreen = ProductListRouter().createModule(factory: self.moduleFactory) {
            self.window?.rootViewController = UINavigationController(rootViewController: initialScreen)
            self.window?.makeKeyAndVisible()
            self.configureAppGeneralAppearence()
        }
    }
    
    private func configureAppGeneralAppearence() {
        UINavigationBar.appearance().barTintColor = .primaryColor
        UINavigationBar.appearance().tintColor = .secondaryColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.secondaryColor]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .highlighted)
        UINavigationBar.appearance().isTranslucent = false
    }
    
}
