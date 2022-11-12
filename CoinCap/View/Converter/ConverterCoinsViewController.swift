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
    private var delegateTapButtonChangeCoin: DelegateToViewProtocol? // to show ChangeCoinInConverterViewController
    
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
        delegateTapButtonChangeCoin = view
        return view
    }
    
    private func setupConverterViewController() {
        view.backgroundColor = .systemGray5
        navigationItem.title = "Сoin converter"
        swapButtonAction()
        changeCoinButtonAction()
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
    // if user press change coin button in ConverterCoinsView need show ChangeCoinInConverterViewController
    private func changeCoinButtonAction() {
        delegateTapButtonChangeCoin?.delgateToView(info: #selector(changeCoinButton))
    }
    // show ChangeCoinInConverterViewController
    @objc private func changeCoinButton() {
        present(ChangeCoinInConverterViewController(), animated: true)
    }
}


