//
//  DelegateProtocol.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation

protocol CryptoProtocol: AnyObject {
    func getCryptoData(data: CryptoData)
}
