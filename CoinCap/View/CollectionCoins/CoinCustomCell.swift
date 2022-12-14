//
//  CoinCustomCell.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation
import UIKit

class CoinCustomCell: UICollectionViewCell {
    private lazy var coinRankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var coinTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AlNile-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coinShortTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var changePriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraintsSubviews()
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setConstraintsSubviews()
    }
    
    private func addSubviews() {
        addSubview(coinImageView)
        addSubview(coinTitleLabel)
        addSubview(coinRankLabel)
        addSubview(coinShortTitleLabel)
        addSubview(priceLabel)
        addSubview(changePriceLabel)
    }
    
    private func setConstraintsSubviews() {
        NSLayoutConstraint.activate([
            coinRankLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinRankLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            coinImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinImageView.leadingAnchor.constraint(equalTo: coinRankLabel.trailingAnchor, constant: 15),
            coinImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -25),
            coinImageView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -25),
            
            coinTitleLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 12),
            coinTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15),
            
            coinShortTitleLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 12),
            coinShortTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15),
            
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            priceLabel.topAnchor.constraint(equalTo: coinTitleLabel.topAnchor),
            
            changePriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            changePriceLabel.bottomAnchor.constraint(equalTo: coinShortTitleLabel.bottomAnchor)
        ])
    }
}

extension CoinCustomCell: DelegateToViewProtocol {
    func delgateToView<T>(info: T?) {
        if let data = info as? (UIImage, Coin) {
            coinImageView.image = data.0
            coinRankLabel.text = data.1.rank
            coinTitleLabel.text = data.1.name
            coinShortTitleLabel.text = data.1.symbol
            priceLabel.text = "$\(DataModel.getPrice(price: data.1.priceUsd))"
            let change = data.1.changePercent24Hr.dropLast(13)
            if change.contains("-") {
                changePriceLabel.text = "\(change)%"
                changePriceLabel.textColor = .red
            } else {
                changePriceLabel.text = "+\(change)%"
                changePriceLabel.textColor = .systemGreen
            }
        }
    }
}
