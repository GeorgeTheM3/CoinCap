//
//  DelegateProtocol.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation
import UIKit

protocol CryptoProtocol: AnyObject {
    func getCryptoCoin(data: [CryptoCoin])
    func refreshCoinPrices(data: CryptoData)
}
