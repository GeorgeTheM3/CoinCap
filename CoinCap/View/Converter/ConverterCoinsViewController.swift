//
//  ConverterCoinsViewController.swift
//  CoinCap
//
//  Created by Георгий Матченко on 19.10.2022.
//

import UIKit

class ConverterCoinsViewController: UIViewController {
    
    private let presenter = Presenter()
    private var firstCoin: CryptoCoin?
    private var secondCoin: CryptoCoin?
    
    override func loadView() {
        super.loadView()
        self.view = getConverterView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConverterViewController()
    }
    
    private func getConverterView() -> UIView {
        let view = ConverterCoinsView()
        return view
    }
    
    private func setupConverterViewController() {
        view.backgroundColor = .systemGray5
        navigationItem.title = "Сoin converter"
    }
}
