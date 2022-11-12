//
//  ConverterView.swift
//  CoinCap
//
//  Created by Георгий Матченко on 20.10.2022.
//

import Foundation
import UIKit

class ConverterCoinsView: UIView {
    // property hold formated coin rate
    private var coinsRate = 0.0
    
    private lazy var firstCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "btc")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var firstCoinShortTitle: UILabel = {
        let label = UILabel()
        label.text = "BTC"
        label.font = UIFont(name: "AlNile-Bold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iHaveLabel: UILabel = {
        let label = UILabel()
        label.text = "У МЕНЯ ЕСТЬ"
        label.font = UIFont.preferredFont(forTextStyle: .footnote).withSize(14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstCoinNumberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "10 BTC"
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(changeFirstValue), for: .editingChanged)
        return textField
    }()
    
    // if change second coin text field
    @objc private func changeFirstValue() {
        // if second textfield empty set first coin empty
        guard firstCoinNumberTextField.text != "" else { return secondCoinNumberTextField.text = "" }
        if let text = firstCoinNumberTextField.text{
            if let number = Double(text) {
                // calculate and formate result string
                let numberCoins = String(number * coinsRate)
                let numberCoinsFormated = DataModel.getPrice(price: numberCoins)
                secondCoinNumberTextField.text = numberCoinsFormated
            }
        }
    }
    
    private lazy var changeFirstCoinButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        return button
    }()
    
    private lazy var secondCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "eth")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var secondCoinShortTitle: UILabel = {
        let label = UILabel()
        label.text = "ETH"
        label.font = UIFont(name: "AlNile-Bold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iWillHaveLabel: UILabel = {
        let label = UILabel()
        label.text = "Я ПОЛУЧУ"
        label.font = UIFont.preferredFont(forTextStyle: .footnote).withSize(14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondCoinNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "200 ETH"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.addTarget(self, action: #selector(changeSecondValue), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // if change second coin text field
    @objc private func changeSecondValue() {
        // if second textfield empty set first coin empty
        guard secondCoinNumberTextField.text != "" else { return firstCoinNumberTextField.text = "" }
        if let text = secondCoinNumberTextField.text{
            if let number = Double(text) {
                // calculate and formate result string
                let numberCoins = String(number / coinsRate)
                let numberCoinsFormated = DataModel.getPrice(price: numberCoins)
                firstCoinNumberTextField.text = numberCoinsFormated
            }
        }
    }
    
    private lazy var changeSecondCoinButton: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        return button
    }()
    
    private lazy var exchangeCoinsRatesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote).withSize(14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // swap two selected coins button
    private lazy var swapCoinButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        return button
    }()
    
    // swap coins animation button
    private func swapAnimation() {
        UIView.animate(withDuration: 0.05) {
            self.swapCoinButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        } completion: { _ in
            UIView.animate(withDuration: 0.05) {
                self.swapCoinButton.transform = .identity
            }
        }
        UIView.animate(withDuration: 0) {
            self.firstCoinImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.secondCoinImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.firstCoinImageView.transform = .identity
                self.secondCoinImageView.transform = .identity
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
        setConstraintsSubviews()
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
        setConstraintsSubviews()
    }
    
    private func createSubviews() {
        addSubview(firstCoinImageView)
        addSubview(firstCoinShortTitle)
        addSubview(firstCoinNumberTextField)
        addSubview(iHaveLabel)
        addSubview(changeFirstCoinButton)
        addSubview(secondCoinImageView)
        addSubview(secondCoinShortTitle)
        addSubview(secondCoinNumberTextField)
        addSubview(iWillHaveLabel)
        addSubview(changeSecondCoinButton)
        addSubview(exchangeCoinsRatesLabel)
        addSubview(swapCoinButton)
    }
    
    private func setConstraintsSubviews() {
        NSLayoutConstraint.activate([
            firstCoinImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.paddingTop),
            firstCoinImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.paddingsInLine),
            firstCoinImageView.heightAnchor.constraint(equalToConstant: Constants.heightMax),
            firstCoinImageView.widthAnchor.constraint(equalToConstant: Constants.heightMax),
            
            iHaveLabel.leadingAnchor.constraint(equalTo: firstCoinImageView.trailingAnchor, constant: Constants.paddingsInLine),
            iHaveLabel.bottomAnchor.constraint(equalTo: firstCoinImageView.topAnchor, constant: -Constants.paddingBetweenLines),
            
            firstCoinShortTitle.topAnchor.constraint(equalTo: firstCoinImageView.bottomAnchor, constant: Constants.paddingBetweenLines),
            firstCoinShortTitle.heightAnchor.constraint(equalToConstant: Constants.heightMin),
            firstCoinShortTitle.centerXAnchor.constraint(equalTo: firstCoinImageView.centerXAnchor),
            
            firstCoinNumberTextField.leadingAnchor.constraint(equalTo: firstCoinImageView.trailingAnchor, constant: Constants.paddingsInLine),
            firstCoinNumberTextField.bottomAnchor.constraint(equalTo: firstCoinImageView.bottomAnchor),
            firstCoinNumberTextField.trailingAnchor.constraint(equalTo: changeFirstCoinButton.leadingAnchor, constant: -Constants.paddingsInLine),
            firstCoinNumberTextField.heightAnchor.constraint(equalToConstant: Constants.heightMax),
            
            changeFirstCoinButton.centerYAnchor.constraint(equalTo: firstCoinNumberTextField.centerYAnchor),
            changeFirstCoinButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.paddingsInLine),
            changeFirstCoinButton.widthAnchor.constraint(equalToConstant: Constants.height),
            changeFirstCoinButton.heightAnchor.constraint(equalToConstant: Constants.height),
            
            secondCoinImageView.topAnchor.constraint(equalTo: firstCoinShortTitle.bottomAnchor, constant: Constants.paddingTop),
            secondCoinImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.paddingsInLine),
            secondCoinImageView.heightAnchor.constraint(equalToConstant: Constants.heightMax),
            secondCoinImageView.widthAnchor.constraint(equalToConstant: Constants.heightMax),
            
            secondCoinShortTitle.topAnchor.constraint(equalTo: secondCoinImageView.bottomAnchor, constant: Constants.paddingBetweenLines),
            secondCoinShortTitle.heightAnchor.constraint(equalToConstant: Constants.heightMin),
            secondCoinShortTitle.centerXAnchor.constraint(equalTo: secondCoinImageView.centerXAnchor),
            
            iWillHaveLabel.leadingAnchor.constraint(equalTo: secondCoinImageView.trailingAnchor, constant: Constants.paddingsInLine),
            iWillHaveLabel.bottomAnchor.constraint(equalTo: secondCoinImageView.topAnchor, constant: -Constants.paddingBetweenLines),
            
            secondCoinNumberTextField.leadingAnchor.constraint(equalTo: secondCoinImageView.trailingAnchor, constant: Constants.paddingsInLine),
            secondCoinNumberTextField.bottomAnchor.constraint(equalTo: secondCoinImageView.bottomAnchor),
            secondCoinNumberTextField.trailingAnchor.constraint(equalTo: changeSecondCoinButton.leadingAnchor, constant: -Constants.paddingsInLine),
            secondCoinNumberTextField.heightAnchor.constraint(equalToConstant: Constants.heightMax),
            
            changeSecondCoinButton.centerYAnchor.constraint(equalTo: secondCoinNumberTextField.centerYAnchor),
            changeSecondCoinButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.paddingsInLine),
            changeSecondCoinButton.widthAnchor.constraint(equalToConstant: Constants.height),
            changeSecondCoinButton.heightAnchor.constraint(equalToConstant: Constants.height),
            
            swapCoinButton.centerXAnchor.constraint(equalTo: changeSecondCoinButton.centerXAnchor),
            swapCoinButton.topAnchor.constraint(equalTo: changeFirstCoinButton.bottomAnchor, constant: Constants.paddingBetweenLines),
            swapCoinButton.bottomAnchor.constraint(equalTo: changeSecondCoinButton.topAnchor, constant: -Constants.paddingBetweenLines),
            
            exchangeCoinsRatesLabel.trailingAnchor.constraint(equalTo: secondCoinNumberTextField.trailingAnchor),
            exchangeCoinsRatesLabel.topAnchor.constraint(equalTo: secondCoinNumberTextField.bottomAnchor, constant: Constants.paddingBetweenLines),
        ])
    }
}

// extension for get two coins from ConverterCoinsViewController
extension ConverterCoinsView: OutputControlletProtocol {
    func outputInfo<T>(info: T?) -> T? {
        (firstCoinNumberTextField.text, secondCoinNumberTextField.text) = (secondCoinNumberTextField.text, firstCoinNumberTextField.text)
        if let data = info as? (CryptoCoin, CryptoCoin) {
            // set first coin
            let firstCoin = data.0
            firstCoinImageView.image = firstCoin.image
            firstCoinShortTitle.text = firstCoin.data.symbol
            firstCoinNumberTextField.placeholder = "Поменять 10 \(firstCoin.data.symbol)"
            
            // set second coins
            let secondCoin = data.1
            secondCoinImageView.image = secondCoin.image
            secondCoinShortTitle.text = secondCoin.data.symbol
            secondCoinNumberTextField.placeholder = "Получить 10 \(secondCoin.data.symbol)"
            
            // get the rate of two coins
            coinsRate = DataModel.converterCoins(first: firstCoin.data.priceUsd, second: secondCoin.data.priceUsd)
            // format price to 1.001
            let formatedCoinsRate = DataModel.getPrice(price: String(coinsRate))
            exchangeCoinsRatesLabel.text = "1 \(firstCoin.data.name) = \(formatedCoinsRate) \(secondCoin.data.name)"
        }
        // animation button
        swapAnimation()
        return nil
    }
}

// extansion for transfer pressed button action to ConverterCoinsViewController
extension ConverterCoinsView: InputControlletProtocol {
    func inputInfo<T>(info: T?) -> T? {
        if let action = info as? Selector {
            swapCoinButton.addTarget(Any.self, action: action, for: .touchUpInside)
        }
        return nil
    }
}
// extansion to present ChangeCoinInConverterViewController if tapped change button
extension ConverterCoinsView: ButtonsActionsProtocol {
    func tapButton(buttonTag: Int, selector: Selector) {
        if buttonTag == 1 {
            changeFirstCoinButton.addTarget(Any.self, action: selector, for: .touchUpInside)
        } else {
            changeSecondCoinButton.addTarget(Any.self, action: selector, for: .touchUpInside)
        }
    }
}
