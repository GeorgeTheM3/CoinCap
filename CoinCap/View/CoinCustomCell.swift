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
//        addSubview(priceLabel)
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
            
//            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            
            changePriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            changePriceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

extension CoinCustomCell: DelegateToViewProtocol {
    func delgateToView<T>(info: T?) {
        if let data = info as? [Constants.CellInfoKeys: Any] {
            coinRankLabel.text = data[.rank] as? String
            coinImageView.image = data[.image] as? UIImage
            coinTitleLabel.text = data[.title] as? String
            coinShortTitleLabel.text = data[.symbol] as? String
//            priceLabel.text = data[.price] as? String
            if let price =  data[.changeInPercent24] as? String {
                if price.contains("-") {
                    changePriceLabel.text = "\(price)%"
                    changePriceLabel.textColor = .red
                } else {
                    changePriceLabel.text = "+\(price)%"
                    changePriceLabel.textColor = .systemGreen
                }
            }
        }
    }
}
