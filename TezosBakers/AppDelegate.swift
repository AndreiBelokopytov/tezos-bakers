//
//  AppDelegate.swift
//  TezosBakers2
//
//  Created by Андрей Белокопытов on 16.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var adapter = BakersServiceAdapter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bakerListViewController = storyboard.instantiateViewController(withIdentifier: "BakerListViewController") as! BakerListViewController
        bakerListViewController.adapter = BakersServiceAdapter()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [bakerListViewController]

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

