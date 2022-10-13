//
//  CoinCustomCell.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation
import UIKit

class CoinCustomCell: UICollectionViewCell {
    private(set) lazy var coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var coinTitleLabel: UILabel = {
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
    }
    
    private func setConstraintsSubviews() {
        NSLayoutConstraint.activate([
            coinImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            coinTitleLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 10),
            coinImageView.centerYAnchor.constraint(equalTo: coinImageView.centerYAnchor)
        ])
    }
}
