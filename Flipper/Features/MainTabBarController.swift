//
//  MainTabBarController.swift
//  Flipper
//
//  Created by Thayallan Srinathan on 2019-01-23.
//  Copyright © 2019 Flipper. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let csvc1 = ComingSoonViewController()
    let csvc2 = ComingSoonViewController()
    let csvc3 = ComingSoonViewController()
    let profileController = ProfileFlowController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileController.profileViewController.delegate = self
        
        setupTabBarProperties()
        setupViewControllers()
        
    }
}

// MARK: Setup TabBar Properties
extension MainTabBarController {
    func setupTabBarProperties() {
        let attributes: [NSAttributedString.Key: Any] = [.font: UI.Font.bold(9)]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: UIControl.State.normal)
        
        tabBar.isTranslucent = true
        tabBar.tintColor = UI.Colors.swishBlue
        tabBar.backgroundColor = UI.Colors.white
        tabBar.layer.borderWidth = 0.1
    }
}

// MARK: - Setup TabBar View Controllers
extension MainTabBarController {
    func setupViewControllers() {
        let vc1 = createFirstViewController()
        let vc2 = createSecondViewController()
        let vc3 = createThirdViewController()
        
        self.viewControllers = [vc1, vc2, vc3]
        
        selectedIndex = 1
        
        profileController.start()
    }
    
    func createFirstViewController() -> UIViewController {
        var navigationVC = UINavigationController(rootViewController: csvc1).then {
            $0.navigationBar.isHidden = true
        }
        navigationVC = setupTabBarItem(for: navigationVC, title: "EXPLORE", imageName: "exploreIcon", selectedImageName: "selectedExploreIcon")
        return navigationVC
    }
    
    func createSecondViewController() -> UIViewController {
        var navigationVC = UINavigationController(rootViewController: csvc2).then {
            $0.navigationBar.isHidden = true
        }
        navigationVC = setupTabBarItem(for: navigationVC, title: "SELL", imageName: "sellIcon", selectedImageName: "selectedSellIcon")
        return navigationVC
    }
    
    func createThirdViewController() -> UIViewController {
        var navigationVC = UINavigationController(rootViewController: profileController).then {
            $0.navigationBar.isHidden = true
        }
        navigationVC = setupTabBarItem(for: navigationVC, title: "PROFILE", imageName: "profileIcon", selectedImageName: "selectedProfileIcon")
        return navigationVC
    }
    
    func setupTabBarItem(for navigationController: UINavigationController, title: String, imageName: String, selectedImageName: String) -> UINavigationController {
        let image = UIImage(named: imageName), selectedImage = UIImage(named: selectedImageName)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return navigationController
    }
}

extension MainTabBarController: ProfileViewDelegate {
    func didTapGetStartedPurchased() {
        selectedIndex = 0
    }
    
    func didTapGetStartedSold() {
        selectedIndex = 1
    }
}
