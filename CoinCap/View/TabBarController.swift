//
//  TabBar.swift
//  CoinCap
//
//  Created by Георгий Матченко on 19.10.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = configureTabBar()
    }
    
    private func configureTabBar() -> [UIViewController] {
        var viewControllers: [UIViewController] = []
        
        let coinsViewController = CoinsViewController()
        coinsViewController.tabBarItem = UITabBarItem(title: "Coins", image: UIImage(systemName: "circle"), selectedImage: UIImage(systemName: "plus"))
        let coinsNavigationController = UINavigationController(rootViewController: coinsViewController)
        viewControllers.append(coinsNavigationController)
        
        let converterCoinsViewController = ConverterCoinsViewController()
        converterCoinsViewController.tabBarItem = UITabBarItem(title: "Coins", image: UIImage(systemName: "circle"), selectedImage: UIImage(systemName: "plus"))
        let converterCoinsNavigationController = UINavigationController(rootViewController: converterCoinsViewController)
        viewControllers.append(converterCoinsNavigationController)
        
        return viewControllers
    }
}
