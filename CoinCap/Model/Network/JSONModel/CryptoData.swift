//
//  File.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation

struct CryptoData: Decodable {
    let data: [Coin]
}

struct Coin: Decodable {
    let id: String
    let rank: String
    let symbol: String
    let name: String
    let priceUsd: String
    let changePercent24Hr: String
    let vwap24Hr: String
    let supply: String
    let maxSupply: String
    let marketCapUsd: String
    let volumeUsd24Hr: String
}
