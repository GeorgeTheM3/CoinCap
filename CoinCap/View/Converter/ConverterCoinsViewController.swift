//
//  ConverterCoinsViewController.swift
//  CoinCap
//
//  Created by Георгий Матченко on 19.10.2022.
//

import UIKit

class ConverterCoinsViewController: UIViewController {
    
    private let presenter = Presenter()
    private var outputInfoToView: OutputControlletProtocol? // pass info to ConverterCoinsView
    private var delegateSwapButton: InputControlletProtocol? // get touch from ConverterCoinsView and swap coins
    
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
        // trasfer two coins to ConverterCoinsView
        outputInfoToView?.outputInfo(info: (firstCoin, secondCoin))
    }
    
    // get two coins for standart ConverterCoinsView
    private func getTwoStandartCoins() {
        firstCoin = LocalStorage.shared.coinsStorage[0]
        secondCoin = LocalStorage.shared.coinsStorage[1]
    }
    
    private func getConverterView() -> UIView {
        let view = ConverterCoinsView()
        outputInfoToView = view
        delegateSwapButton = view
        return view
    }
    
    private func setupConverterViewController() {
        view.backgroundColor = .systemGray5
        navigationItem.title = "Сoin converter"
        swapButtonAction()
    }
    
    // if user press swap button in ConverterCoinsView need swap coins
    private func swapButtonAction() {
        delegateSwapButton?.inputInfo(info: #selector(swapCoinsAction))
    }
    // and pass new info to ConverterCoinsView
    @objc private func swapCoinsAction() {
        (firstCoin,secondCoin) = (secondCoin,firstCoin)
        outputInfoToView?.outputInfo(info: (firstCoin, secondCoin))
    }
}


