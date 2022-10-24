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
    }
    
    private func setConstraintsSubviews() {
        NSLayoutConstraint.activate([
            firstCoinImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            firstCoinImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            firstCoinImageView.heightAnchor.constraint(equalToConstant: 50),
            firstCoinImageView.widthAnchor.constraint(equalToConstant: 50),
            
            iHaveLabel.leadingAnchor.constraint(equalTo: firstCoinImageView.trailingAnchor, constant: 20),
            iHaveLabel.bottomAnchor.constraint(equalTo: firstCoinImageView.topAnchor, constant: -10),
            
            firstCoinShortTitle.topAnchor.constraint(equalTo: firstCoinImageView.bottomAnchor, constant: 10),
            firstCoinShortTitle.centerXAnchor.constraint(equalTo: firstCoinImageView.centerXAnchor),
            
            firstCoinNumberTextField.leadingAnchor.constraint(equalTo: firstCoinImageView.trailingAnchor, constant: 20),
            firstCoinNumberTextField.bottomAnchor.constraint(equalTo: firstCoinImageView.bottomAnchor),
            firstCoinNumberTextField.trailingAnchor.constraint(equalTo: changeFirstCoinButton.leadingAnchor, constant: -20),
            firstCoinNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            changeFirstCoinButton.centerYAnchor.constraint(equalTo: firstCoinNumberTextField.centerYAnchor),
            changeFirstCoinButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            changeFirstCoinButton.widthAnchor.constraint(equalToConstant: 30),
            changeFirstCoinButton.heightAnchor.constraint(equalToConstant: 30),
            
            secondCoinImageView.topAnchor.constraint(equalTo: firstCoinShortTitle.bottomAnchor, constant: 50),
            secondCoinImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            secondCoinImageView.heightAnchor.constraint(equalToConstant: 50),
            secondCoinImageView.widthAnchor.constraint(equalToConstant: 50),
            
            secondCoinShortTitle.topAnchor.constraint(equalTo: secondCoinImageView.bottomAnchor, constant: 10),
            secondCoinShortTitle.centerXAnchor.constraint(equalTo: secondCoinImageView.centerXAnchor),
            
            iWillHaveLabel.leadingAnchor.constraint(equalTo: secondCoinImageView.trailingAnchor, constant: 20),
            iWillHaveLabel.bottomAnchor.constraint(equalTo: secondCoinImageView.topAnchor, constant: -10),
            
            secondCoinNumberTextField.leadingAnchor.constraint(equalTo: secondCoinImageView.trailingAnchor, constant: 20),
            secondCoinNumberTextField.bottomAnchor.constraint(equalTo: secondCoinImageView.bottomAnchor),
            secondCoinNumberTextField.trailingAnchor.constraint(equalTo: changeSecondCoinButton.leadingAnchor, constant: -20),
            secondCoinNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            changeSecondCoinButton.centerYAnchor.constraint(equalTo: secondCoinNumberTextField.centerYAnchor),
            changeSecondCoinButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            changeSecondCoinButton.widthAnchor.constraint(equalToConstant: 30),
            changeSecondCoinButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
