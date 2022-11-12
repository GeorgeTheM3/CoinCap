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
    private var delegateTapButtonChangeCoin: ButtonsActionsProtocol? // to show ChangeCoinInConverterViewController
    
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
        // gesture tap to close keyboard
        gestureCloseKeyboard()
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
    
    // gesture tap to close keyboard
    private func gestureCloseKeyboard() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboardSwipe))
        gestureRecognizer.numberOfTouchesRequired = 1
        gestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(gestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    @objc private func closeKeyboardSwipe(_ gesture: UITapGestureRecognizer) {
        view.endEditing(true)
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
        delegateTapButtonChangeCoin?.tapButton(buttonTag: 1, selector: #selector(changeFirstCoinButton))
        delegateTapButtonChangeCoin?.tapButton(buttonTag: 2, selector: #selector(changeSecondCoinButton))
    }
    // show ChangeCoinInConverterViewController
    @objc private func changeFirstCoinButton() {
        present(ChangeCoinInConverterViewController(curentCoin: 1, delegate: self), animated: true)
    }
    @objc private func changeSecondCoinButton() {
        present(ChangeCoinInConverterViewController(curentCoin: 2, delegate: self), animated: true)
    }
}

// get new selected coin from ChangeCoinInConverterViewController
extension ConverterCoinsViewController: OutputControlletProtocol {
    func outputInfo<T>(info: T?) -> T? {
        if let data = info as? (CryptoCoin, Int) {
            if data.1 == 1 {
                firstCoin = data.0
            } else {
                secondCoin = data.0
            }
        }
        outputInfoToView?.outputInfo(info: (firstCoin, secondCoin))
        return nil
    }
}
