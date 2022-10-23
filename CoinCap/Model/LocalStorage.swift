//
//  LocalStorage.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation

class LocalStorage {
    static let shared = LocalStorage()
    
    var coinsStorage: [CryptoCoin] = []
}
