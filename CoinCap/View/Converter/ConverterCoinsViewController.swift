//
//  ConverterCoinsViewController.swift
//  CoinCap
//
//  Created by Георгий Матченко on 19.10.2022.
//

import UIKit

class ConverterCoinsViewController: UIViewController {
    
    private let presenter = Presenter()
    private var outputInfoToView: OutputControlletProtocol?
    private var firstCoin: CryptoCoin?
    private var secondCoin: CryptoCoin?
    
    override func loadView() {
        super.loadView()
        self.view = getConverterView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConverterViewController()
        getTwoStandartCoins()
        // trasfer two coins to view
        outputInfoToView?.outputInfo(info: (firstCoin, secondCoin))
    }
    
    // get two coins for standart view
    private func getTwoStandartCoins() {
        firstCoin = LocalStorage.shared.coinsStorage[0]
        secondCoin = LocalStorage.shared.coinsStorage[1]
    }
    
    private func getConverterView() -> UIView {
        let view = ConverterCoinsView()
        outputInfoToView = view
        return view
    }
    
    private func setupConverterViewController() {
        view.backgroundColor = .systemGray5
        navigationItem.title = "Сoin converter"
    }
}
