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
        // Создаём ViewModel
        let startViewModel = StartViewModel()
        
        // Инициализируем StartViewController с ViewModel
        let startViewController = StartViewController(viewModel: startViewModel)
        
        // Создаём UIWindow и назначаем rootViewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = startViewController
        window?.makeKeyAndVisible()
        
        
        return true
    }
}

