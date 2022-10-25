//
//  ConverterView.swift
//  CoinCap
//
//  Created by Георгий Матченко on 20.10.2022.
//

import Foundation
import UIKit

class ConverterCoinsView: UIView {
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
    
    @objc private func changeFirstValue() {
        if let text = firstCoinNumberTextField.text {
            secondCoinNumberTextField.text =  text
        }
    }

    private lazy var changeFirstCoinButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
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
    
    @objc private func changeSecondValue() {
        if let text = secondCoinNumberTextField.text {
            firstCoinNumberTextField.text =  text
        }
    }
    
    private lazy var changeSecondCoinButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        return button
    }()
    
    private lazy var exchangeCoinsRatesLabel: UILabel = {
        let label = UILabel()
        if let first = firstCoinShortTitle.text, let second = secondCoinShortTitle.text {
            label.text = "1 \(first) = 20 \(second)"
        }
        label.font = UIFont.preferredFont(forTextStyle: .footnote).withSize(14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
            firstCoinShortTitle.centerXAnchor.constraint(equalTo: firstCoinImageView.centerXAnchor),
            
            firstCoinNumberTextField.leadingAnchor.constraint(equalTo: firstCoinImageView.trailingAnchor, constant: Constants.paddingsInLine),
            firstCoinNumberTextField.bottomAnchor.constraint(equalTo: firstCoinImageView.bottomAnchor),
            firstCoinNumberTextField.trailingAnchor.constraint(equalTo: changeFirstCoinButton.leadingAnchor, constant: -Constants.paddingsInLine),
            firstCoinNumberTextField.heightAnchor.constraint(equalToConstant: Constants.heightMax),
            
            changeFirstCoinButton.centerYAnchor.constraint(equalTo: firstCoinNumberTextField.centerYAnchor),
            changeFirstCoinButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.paddingsInLine),
            changeFirstCoinButton.widthAnchor.constraint(equalToConstant: Constants.heightMin),
            changeFirstCoinButton.heightAnchor.constraint(equalToConstant: Constants.heightMin),
            
            secondCoinImageView.topAnchor.constraint(equalTo: firstCoinShortTitle.bottomAnchor, constant: Constants.paddingTop),
            secondCoinImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.paddingsInLine),
            secondCoinImageView.heightAnchor.constraint(equalToConstant: Constants.heightMax),
            secondCoinImageView.widthAnchor.constraint(equalToConstant: Constants.heightMax),
            
            secondCoinShortTitle.topAnchor.constraint(equalTo: secondCoinImageView.bottomAnchor, constant: Constants.paddingBetweenLines),
            secondCoinShortTitle.centerXAnchor.constraint(equalTo: secondCoinImageView.centerXAnchor),
            
            iWillHaveLabel.leadingAnchor.constraint(equalTo: secondCoinImageView.trailingAnchor, constant: Constants.paddingsInLine),
            iWillHaveLabel.bottomAnchor.constraint(equalTo: secondCoinImageView.topAnchor, constant: -Constants.paddingBetweenLines),
            
            secondCoinNumberTextField.leadingAnchor.constraint(equalTo: secondCoinImageView.trailingAnchor, constant: Constants.paddingsInLine),
            secondCoinNumberTextField.bottomAnchor.constraint(equalTo: secondCoinImageView.bottomAnchor),
            secondCoinNumberTextField.trailingAnchor.constraint(equalTo: changeSecondCoinButton.leadingAnchor, constant: -Constants.paddingsInLine),
            secondCoinNumberTextField.heightAnchor.constraint(equalToConstant: Constants.heightMax),
            
            changeSecondCoinButton.centerYAnchor.constraint(equalTo: secondCoinNumberTextField.centerYAnchor),
            changeSecondCoinButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.paddingsInLine),
            changeSecondCoinButton.widthAnchor.constraint(equalToConstant: Constants.heightMin),
            changeSecondCoinButton.heightAnchor.constraint(equalToConstant: Constants.heightMin),
            
            exchangeCoinsRatesLabel.trailingAnchor.constraint(equalTo: secondCoinNumberTextField.trailingAnchor),
            exchangeCoinsRatesLabel.topAnchor.constraint(equalTo: secondCoinNumberTextField.bottomAnchor, constant: Constants.paddingBetweenLines),
        ])
    }
}
