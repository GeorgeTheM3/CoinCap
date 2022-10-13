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
            self.delegate?.getCryptoData(data: result)
        }
    }
}
