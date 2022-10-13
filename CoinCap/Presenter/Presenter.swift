//
//  Presenter.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation

class Presenter {
    weak private var delegate: CryptoProtocol?
    
    public func setViewToDelegate(view: CryptoProtocol?) {
        self.delegate = view
    }
    
    public func getData() {
        NetworkManager.shared.fetchData(url: "https://api.coincap.io/v2/assets", model: CryptoData.self) { result in
            for item in result.data {
                let url1 = "https://assets.coincap.io/assets/icons/"
                let url2 = "\(item.symbol.lowercased())"
                let url3 = "@2x.png"
                let resultURL = url1 + url2 + url3
                NetworkManager.shared.loadImage(url: resultURL) { image in
                    self.delegate?.getCryptoCoin(data: CryptoCoin(data: item, image: image))
                }
            }
        }
    }
}
