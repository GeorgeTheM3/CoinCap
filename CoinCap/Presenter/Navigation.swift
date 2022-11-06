//
//  Navigation.swift
//  CoinCap
//
//  Created by Георгий Матченко on 28.10.2022.
//

import Foundation
import UIKit

class Navigation: UINavigationController {

    func start(_ viewController: UIViewController, title: String, complition: (UILabel) -> ()) {
        viewController.title = title
        navigationController?.pushViewController(viewController, animated: true)
    }
}
