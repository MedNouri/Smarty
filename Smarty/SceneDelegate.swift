//
//  SceneDelegate.swift
//  Smarty
//
//  Created by MohamedNouri on 29/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
          window = UIWindow(frame: windowScene.coordinateSpace.bounds)
          window?.windowScene = windowScene
        //TODO: When the user accesses the app for the first time, he/she is prompted to enter his/her name.Once entered, the application always redirects him or her directly to HOME UI.
          window?.rootViewController = UserDefaults.standard.getUserName() != nil ? UINavigationController(rootViewController:HomeViewController() )  : WelcomeViewController()
          window?.makeKeyAndVisible()
        
        
    }

 

}

