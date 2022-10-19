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
        NetworkManager.shared.fetchData(url: Constants.shared.jsonURL, model: CryptoData.self) { result in
            for item in result.data {
                let key = "\(item.symbol.lowercased())"
                let resultURL = Constants.shared.getImageURL(key: key)
                NetworkManager.shared.loadImage(url: resultURL) { image in
                    self.delegate?.getCryptoCoin(data: CryptoCoin(data: item, image: image))
                }
            }
        }
    }
}
