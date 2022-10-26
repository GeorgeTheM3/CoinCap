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
        setingTabBar()
    }
    
    private func configureTabBar() -> [UIViewController] {
        var viewControllers: [UIViewController] = []
        
        let coinsViewController = CoinsViewController()
        coinsViewController.tabBarItem = UITabBarItem(title: "Coins", image: UIImage(systemName: "bitcoinsign.circle"), selectedImage: UIImage(systemName: "bitcoinsign.circle.fill"))
        let coinsNavigationController = UINavigationController(rootViewController: coinsViewController)
        viewControllers.append(coinsNavigationController)
        
        let converterCoinsViewController = ConverterCoinsViewController()
        converterCoinsViewController.tabBarItem = UITabBarItem(title: "Coins", image: UIImage(systemName: "arrow.left.arrow.right.circle"), selectedImage: UIImage(systemName: "arrow.left.arrow.right.circle.fill"))
        let converterCoinsNavigationController = UINavigationController(rootViewController: converterCoinsViewController)
        viewControllers.append(converterCoinsNavigationController)
        
        let converterCoinsViewController2 = CoinDetailViewController()
        converterCoinsViewController2.tabBarItem = UITabBarItem(title: "Coins", image: UIImage(systemName: "arrow.left.arrow.right.circle"), selectedImage: UIImage(systemName: "arrow.left.arrow.right.circle.fill"))
        let converterCoinsNavigationController2 = UINavigationController(rootViewController: converterCoinsViewController2)
        viewControllers.append(converterCoinsNavigationController2)
        
        return viewControllers
    }
    
    private func setingTabBar() {
        self.tabBar.tintColor = .orange
    }
}
