//
//  AppDelegate.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 01.01.2025.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let networkService = NetworkService()
        let imageService = ImageDownloadService(networkService: networkService)
        let startViewModel = StartViewModel(imageService: imageService)
        let startVC = StartViewController(viewModel: startViewModel)
        let navigationController = UINavigationController(rootViewController: startVC)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

