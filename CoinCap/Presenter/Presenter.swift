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
    
    // load json for url
    public func getData(url: String) {
        NetworkManager.shared.fetchData(url: url , model: CryptoData.self) { result in
            var coinsArray: [CryptoCoin] = []
            for item in result.data {
                let key = "\(item.symbol.lowercased())"
                let resultURL = Constants.shared.getImageURL(key: key)
                // load image to curent coin
                NetworkManager.shared.loadImage(url: resultURL) { image in
                    let coin = CryptoCoin(data: item, image: image)
                    LocalStorage.shared.coinsStorage.append(coin)
                    coinsArray.append(coin)
                }
            }
            // pas data
            self.delegate?.getCryptoCoin(data: coinsArray)
        }
    }
    
    public func refreshCoinsCrices(numberOfCoins: Int) {
        NetworkManager.shared.fetchData(url: Constants.shared.getJsonURL(key: numberOfCoins), model: CryptoData.self) { result in
            self.delegate?.refreshCoinPrices(data: result)
        }
    }
}

extension Presenter: OutputPresenterProtocol {
    public func getInfo<T>(info: T?) -> T? {
        return nil
    }
}
